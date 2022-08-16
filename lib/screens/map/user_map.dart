import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:my_app/utils/location.dart';

import '../../utils/constants.dart';

class UserMap extends StatefulWidget {
  const UserMap({Key? key}) : super(key: key);
  static const routeName = '/user-location';
  static const LatLng latLngNIC = LatLng(10.7897002, 106.708346);
  final CameraPosition cameraNIC = const CameraPosition(target: latLngNIC, zoom: 16);
  final Marker markerNIC = const Marker(
      markerId: MarkerId("Nichietsu"),
      position: latLngNIC,
      infoWindow: InfoWindow(
        title: "Nichietsu",
        snippet: "Vị trí công ty Nichietsu",
      ));

  @override
  State<UserMap> createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  Completer<GoogleMapController> _controller = Completer();
  final _searchPlaceController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _goToMyLocation() async {
    try {
      final GoogleMapController controller = await _controller.future;
      final userPosition = await UserLocation.instance.getUserCurrentPosition();
      CameraPosition cameraUser =
          CameraPosition(target: LatLng(userPosition.latitude!, userPosition.longitude!), zoom: 16);
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraUser));
    } catch (e) {
      print(e);
    }
  }

  void autoCompleteSearch(String value) async {}

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                markers: <Marker>{widget.markerNIC},
                initialCameraPosition: widget.cameraNIC,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              buildSearchPlace(context),
            ],
          ),
          floatingActionButton: buildMoveMyLocationButton()),
    );
  }

  Positioned buildSearchPlace(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: GestureDetector(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(color: Colors.white, borderRadius: MyShape.radius_8),
          child: Row(
            children: [
              Icon(Icons.location_on, size: 25, color: Theme.of(context).primaryColor),
              SizedBox(width: 5),
              //here we show the address on the top
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      autoCompleteSearch(value);
                    } else {}
                  },
                  controller: _searchPlaceController,
                  maxLines: 1,
                  decoration: InputDecoration(border: InputBorder.none, hintText: 'Tìm kiếm'),
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.search, size: 25, color: Theme.of(context).textTheme.bodyText1!.color),
            ],
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
}
