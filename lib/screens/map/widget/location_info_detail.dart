import 'package:flutter/material.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/dum_data.dart';
import 'package:my_app/utils/enum.dart';
import 'package:my_app/utils/extension.dart';

class LocationInfoDetail extends StatefulWidget {
  const LocationInfoDetail({Key? key}) : super(key: key);

  @override
  State<LocationInfoDetail> createState() => _LocationInfoDetailState();
}

class _LocationInfoDetailState extends State<LocationInfoDetail> {
  late TypeButtonMap btnCrrClicked;

  @override
  void initState() {
    super.initState();
    btnCrrClicked = TypeButtonMap.DIRECTION;
  }

  Widget buildHead() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nichietsu Building").title(Colors.white, fWeight: FontWeight.bold, fSize: 18),
            SizedBox(height: 8),
            Row(
              children: [
                Text("5").large(MyColor.textGrey),
                ...buildStars(5),
                Text("(28)").large(MyColor.textGrey),
              ],
            ),
            Text("Công ty phần mềm").large(MyColor.textGrey)
          ],
        ),
        CircleAvatar(
          radius: 26.0,
          backgroundImage: NetworkImage(logoNic),
          backgroundColor: Colors.transparent,
        )
      ],
    );
  }

  List<Widget> buildStars(int numberOfItem) {
    List<Widget> stars = List<Widget>.generate(
      numberOfItem,
      (index) => Icon(
        Icons.star_sharp,
        color: Colors.yellow,
        size: 20,
      ),
    );
    return stars;
  }

  Widget buildButtonIcon(TypeButtonMap type) {
    final isClicked = btnCrrClicked == type;
    final decoByBtnCrrClicked = BoxDecoration(
      color: isClicked ? MyColor.blueButtonMap : null,
      border: !isClicked ? Border.all(width: 1, color: MyColor.borderButtonMap) : null,
      borderRadius: BorderRadius.circular(21),
    );
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: decoByBtnCrrClicked,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(type.iconName, size: 24, color: !isClicked ? MyColor.blueButtonMap : Colors.black),
          SizedBox(width: 5),
          Text(type.text).large(!isClicked ? MyColor.blueButtonMap : Colors.black),
        ],
      ),
    );
  }

  SingleChildScrollView buildButtonMap() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildButtonIcon(TypeButtonMap.DIRECTION),
          buildButtonIcon(TypeButtonMap.CALL),
          buildButtonIcon(TypeButtonMap.SAVE),
          buildButtonIcon(TypeButtonMap.SHARE),
        ],
      ),
    );
  }

  Widget buildListImage() {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagesNicMap.length,
        itemBuilder: (BuildContext context, int index) {
          final item = imagesNicMap[index];
          if (item.type == 1) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildItem(item.type, item.urls[0], 0),
                SizedBox(width: 10),
              ],
            );
          } else {
            // type == 2
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    buildItem(item.type, item.urls[0], 5, width: 150),
                    SizedBox(height: 10),
                    buildItem(item.type, item.urls[1], 5, width: 150),
                  ],
                ),
                SizedBox(width: 10),
              ],
            );
          }
        },
      ),
    );
  }

  Widget buildItem(int type, String url, int sizeMargin, {double? width}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        url,
        height: (300 / type) - sizeMargin,
        width: width ?? 230,
        fit: BoxFit.cover, // 10 is SizeBox in middle two image
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).copyWith().size.height * 0.75,
      decoration: BoxDecoration(
        color: MyColor.bgBlack,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHead(),
          SizedBox(height: 10),
          buildButtonMap(),
          SizedBox(height: 10),
          buildListImage(),
        ],
      ),
    );
  }
}
