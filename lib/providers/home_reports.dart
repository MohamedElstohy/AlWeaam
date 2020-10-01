import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/slider_report.dart';
import '../models/sorted_report.dart';

class HomeReports with ChangeNotifier{
  static const homeURL = 'https://www.alweeam.com.sa/wp-json/v3/home?fbclid=IwAR0jmRgqATCw8XU-wUjgQ4dEEuylJOkLXt4mexzrjFKYnW528D1TvJrFXR0';

  List<SliderReport> _sliderList = [];
  List<List<SortedReport>> _sortedList = [];
  bool isLoading = true;

  List<SliderReport> get sliderList{
    return [..._sliderList];
  }

  List<List<dynamic>> get sortedList{
    return [..._sortedList];
  }
  
  Future<void> getHomeReports() async{
    List<dynamic> slider = [];
    List<dynamic> news = [];
    List<List<SortedReport>> posts = [];

    http.Response response = await http.get(homeURL);
    Map<String , dynamic> data = json.decode(response.body);

    slider = data['slider'];
    news = data['categories'];

    _sliderList = slider.map((e) =>
      SliderReport(
        title: e['post_title'],
        imageUrl: e['post_media_thumbnail'],
        date: DateTime.parse(e['post_date']),
        content: e['post_content'],
        reporter: e['meta']['morasel']
      )
    ).toList();

    for(var category in news){
      List<SortedReport> row = [];
      for(var report in category['posts']){
        final SortedReport sortedReport = SortedReport(
          catId: category['catid'],
          catOrder: category['catorder'],
          catName: category['اخر الاخبار'],
          title: report['post_title'],
          content: report['post_content'],
          imageUrl: report['post_media_thumbnail'],
          date: DateTime.parse(report['post_date']),
          reporter: report['meta']['morasel']
        );
        row.add(sortedReport);
      }
      posts.add(row);
    }
    _sortedList = posts;
    
    isLoading = false;
    notifyListeners();
  }
}