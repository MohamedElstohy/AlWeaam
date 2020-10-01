import 'package:flutter/material.dart';

class SortedReport{
  final int catId;
  final int catOrder;
  final String catName;
  final String title;
  final String imageUrl;
  final String content;
  final DateTime date;
  final String reporter;
  // final List<List<SliderReport>> posts;
  bool isMarked;

  SortedReport({
    @required this.catId,
    @required this.catOrder,
    @required this.catName,
    @required this.title,
    @required this.imageUrl,
    @required this.content,
    @required this.date,
    @required this.reporter,
    // @required this.posts,
    this.isMarked = false
  });
}