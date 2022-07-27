import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingTextShimmer extends StatelessWidget {
  final TextStyle? textStyle;
  const LoadingTextShimmer({Key? key, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Đang tải',
            style: textStyle,
          ),
        ));
  }
}
