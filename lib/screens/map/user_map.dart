import 'dart:async';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/models/place_address/place_address.dart';
import 'package:my_app/screens/map/widget/my-marker.dart';
import 'package:my_app/utils/extension.dart';
import 'package:my_app/utils/location.dart';

import '../../networks/place_address_request.dart';
import '../../utils/constants.dart';

class UserMap extends StatefulWidget {
  const UserMap({Key? key}) : super(key: key);
  static const routeName = '/user-location';

  static const LatLng latLngNIC = LatLng(10.7897002, 106.708346);
  final CameraPosition cameraNIC = const CameraPosition(target: latLngNIC, zoom: 16);

  @override
  State<UserMap> createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  final Completer<GoogleMapController> _controller = Completer();
  final _searchPlaceController = TextEditingController();
  final PlaceAddressRequest apiRequest = PlaceAddressRequest();
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  final GlobalKey globalKey = GlobalKey();

  late List<PlaceAddress> dataSearched;
  Marker? marker;

  @override
  void initState() {
    super.initState();
    dataSearched = [];
    _searchPlaceController.text = "";
    initMarkerDefault();
  }

  Future<void> initMarkerDefault() {
    /*
     it's have to wait 2second for treeWidget is rendered and get
     myMarker in treeWidget with globalKey to custom marker
     */
    return Future.delayed(const Duration(milliseconds: 1500), () async {
      final icon = await MarkerIcon.widgetToIcon(globalKey);
      setState(() {
        marker = Marker(
          markerId: MarkerId("Nichietsu"),
          position: UserMap.latLngNIC,
          icon: icon,
          onTap: () {
            _customInfoWindowController.addInfoWindow!(buildInfoWindow(), UserMap.latLngNIC);
          },
        );
      });
    });
  }

  Container buildInfoWindow() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: MyShape.radius_8,
        color: Colors.white,
        boxShadow: MyShadow.shadow,
      ),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: MyShape.radius_8,
              image: DecorationImage(
                image: NetworkImage(
                  "https://api-portal.nichietsuvn.com/storage/introductions/27122021/61c96cb8df8f3.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: const [
                Expanded(child: Text("Nichietsu building")),
                Text("5.0"),
                Icon(Icons.star, color: Colors.yellow, size: 24),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Xem giá'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  void autoCompleteSearch(String value) async {
    final data = await apiRequest.getPlace(value);
    setState(() {
      dataSearched = data;
    });
  }

  Future<void> _goToMyLocation() async {
    try {
      final GoogleMapController controller = await _controller.future;
      final userPosition = await UserLocation.instance.getUserCurrentPosition();
      final latLngUser = LatLng(userPosition.latitude!, userPosition.longitude!);
      CameraPosition cameraUser = CameraPosition(target: latLngUser, zoom: 16);
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraUser));
      final icon = await MarkerIcon.widgetToIcon(globalKey);
      setState(() {
        marker = Marker(
          markerId: MarkerId("Vị trí của tôi"),
          icon: icon,
          position: latLngUser,
          infoWindow: InfoWindow(
            title: "Vị trí của tôi",
            snippet: "Vị trí của tôi",
          ),
        );
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _goToPlaceAddress(PlaceAddress item) async {
    final GoogleMapController controller = await _controller.future;
    final latLngAddress = LatLng(double.parse(item.lat!), double.parse(item.lon!));
    CameraPosition cameraUser = CameraPosition(target: latLngAddress, zoom: 16);
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraUser));
    setState(() {
      marker = Marker(
        markerId: MarkerId(item.displayPlace!),
        position: latLngAddress,
        infoWindow: InfoWindow(
          title: item.displayPlace!,
          snippet: item.displayAddress!,
        ),
      );
      _searchPlaceController.text = item.displayAddress!;
      dataSearched = [];
    });
  }

  Positioned buildSearchPlace(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: Column(
        children: [
          viewSearch(context),
          SizedBox(height: 10),
          dataSearched.isNotEmpty ? viewDataResult(context) : SizedBox(),
        ],
      ),
    );
  }

  Widget viewSearch(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: MyShape.radius_8,
          boxShadow: MyShadow.shadow,
        ),
        child: Row(
          children: [
            Icon(Icons.search, size: 25, color: Theme.of(context).textTheme.bodyText1!.color),
            SizedBox(width: 5),
            //here we show the address on the top
            Expanded(
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    autoCompleteSearch(value);
                  }
                },
                controller: _searchPlaceController,
                maxLines: 1,
                decoration: InputDecoration(border: InputBorder.none, hintText: 'Tìm kiếm'),
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: () => _searchPlaceController.text = "",
              iconSize: 25,
              color: Theme.of(context).textTheme.bodyText1!.color,
              icon: Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewDataResult(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(8),
        boxShadow: MyShadow.shadow,
      ),
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.separated(
        itemCount: dataSearched.length,
        itemBuilder: (BuildContext context, int index) {
          return itemResult(context, dataSearched[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5),
      ),
    );
  }

  Widget itemResult(BuildContext context, PlaceAddress item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: MyShape.radius_8, //radius for widget
        color: Colors.white, //color display
      ),
      child: Material(
        color: Colors.transparent, // color ripper effect
        borderRadius: MyShape.radius_8,
        child: InkWell(
          borderRadius: MyShape.radius_8, // radius for color ripper effect
          onTap: () {
            _goToPlaceAddress(item);
          },
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 25, color: Theme.of(context).primaryColor),
                SizedBox(width: 5),
                //here we show the address on the top
                Expanded(child: Text(item.displayAddress ?? "").mediumLong(Colors.black, 1)),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildMoveMyLocationButton() {
    return Padding(
      padding: EdgeInsets.only(right: 45),
      child: FloatingActionButton.extended(
        onPressed: _goToMyLocation,
        label: const Text('Vị trí của tôi'),
        icon: const Icon(Icons.my_location_rounded),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              MyMarker(globalKey),
              GoogleMap(
                mapType: MapType.normal,
                markers: marker == null ? <Marker>{} : <Marker>{marker!},
                initialCameraPosition: widget.cameraNIC,
                onTap: (position) {
                  _customInfoWindowController.hideInfoWindow!();
                },
                onCameraMove: (position) {
                  _customInfoWindowController.onCameraMove!();
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  _customInfoWindowController.googleMapController = controller;
                },
              ),
              buildSearchPlace(context),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: 200,
                width: 200,
                offset: 50,
              ),
            ],
          ),
          floatingActionButton: buildMoveMyLocationButton()),
    );
  }
}
