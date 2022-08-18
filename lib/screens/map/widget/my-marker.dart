import 'package:flutter/material.dart';
import 'package:my_app/utils/constants.dart';

class MyMarker extends StatelessWidget {
  // declare a global key and get it trough Constructor

  const MyMarker(this.globalKeyMyWidget);
  final GlobalKey globalKeyMyWidget;
  //4h10
  @override
  Widget build(BuildContext context) {
    // wrap your widget with RepaintBoundary and
    // pass your global key to RepaintBoundary
    return RepaintBoundary(
        key: globalKeyMyWidget,
        child: Stack(
          children: [
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/locate.png"),
                  fit: BoxFit.contain,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: MyColor.softPink,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.home_work_rounded,
                          size: 50,
                          color: Colors.white,
                        )),
                    SizedBox(width: 10),
                    Text("Nichietsu", style: TextStyle(fontSize: 50)),
                  ],
                ),
              ) /* add child content here */,
            ),
          ],
        ));
  }
}
