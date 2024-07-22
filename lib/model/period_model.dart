import 'package:flutter/material.dart';
class PeriodModel {
  const PeriodModel({
    required this.index,
    required this.image,
    required this.period,
    required this.time,
  });
  final int index;
  final AssetImage image;
  final String period;
  final String time;
}