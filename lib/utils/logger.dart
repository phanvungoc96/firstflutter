import 'package:flutter/foundation.dart';

class Logger {
  static log(String text) {
    if (kDebugMode) {
      print(text);
    }
  }
}
