import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/utils/logger.dart';
import 'package:my_app/utils/extension.dart';

import 'package:my_app/model/category.dart';
import 'constants.dart';

class ImageHelper {
  ImageHelper._internal();

  static final ImageHelper _instance = ImageHelper._internal();

  static ImageHelper instance() {
    return _instance;
  }

  CachedNetworkImage loadCacheImg(
    double width,
    double height,
    String urlImage,
    Object itemData,
    String prefix,
    Function callback,
  ) {
    return CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: urlImage,
        errorWidget: (context, url, error) => _loadingImg(width, height, prefix, errImg: true),
        progressIndicatorBuilder: (context, url, download) =>
            _loadingImg(width, height, loadPercent: download.progress, prefix),
        imageBuilder: ((context, imageProvider) {
          return callback(width, height, imageProvider, itemData);
        }));
  }

  Widget _loadingImg(double width, double height, String prefix, {bool? errImg, double? loadPercent}) {
    List<Widget> loading = [];

    Logger.log("$prefix ---> Load image: $loadPercent");

    if (loadPercent != null) {
      loading.add(CircularProgressIndicator(
        value: loadPercent.asFixed(2),
        color: MyColor.green,
      ));
      loading.add(Text("Đang tải ${(loadPercent * 100).toStringAsFixed(2)}%...").small(MyColor.grey));
      double.parse(loadPercent.toStringAsFixed(2));
    } else {
      loading.add(const Text("Đang tải...").small(MyColor.grey));
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(borderRadius: MyShape.radius_5, color: MyColor.lightGrey),
      child: errImg == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 24),
                const Text("Đã có lỗi xảy ra").small(Colors.red),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: loading,
            ),
    );
  }
}
