import 'package:flutter/foundation.dart';
import 'package:newspaper/models/slider_report.dart';

class Category{
  final int id;
  final String name;
  final String description;
  final List<SliderReport> posts;

  Category({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.posts,
  });
}