import 'package:flutter/material.dart';

class SliderReport{
  final String title;
  final String imageUrl;
  final String content;
  final DateTime date;
  final String reporter;
  // final int catOrder;
  bool isMarked;

  SliderReport({
    @required this.title,
    @required this.imageUrl,
    @required this.content,
    @required this.date,
    @required this.reporter,
    // @required this.catOrder,
    this.isMarked = false
  });
}