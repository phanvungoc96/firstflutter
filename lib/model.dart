import 'dart:io';

import 'package:flutter/foundation.dart';

class Item {
  final String title;
  final String time;
  final String subTitle;
  final String content;
  const Item(
      {required this.title,
      required this.time,
      required this.subTitle,
      required this.content});
}

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
