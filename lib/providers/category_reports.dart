import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/slider_report.dart';
import '../models/category.dart';

class CategoryReports with ChangeNotifier{
  static const categoriesURL = 'https://www.alweeam.com.sa/wp-json/wp/v2/categories?fbclid=IwAR1l1gkYyHgBayyUe3qlULfj7Ohm1gM5B82YkeJv992WIWUH5aXKa98z7m4';

  List<Category> _categories = [];
  bool isLoading = true;

  List<Category> get categories{
    return [..._categories];
  }

  Future<List<SliderReport>> catPosts(int catID) async{
    List<SliderReport> results = [];

    http.Response response = await http.get('https://www.alweeam.com.sa/wp-json/wp/v2/posts?categories=$catID&fbclid=IwAR1ev-usRdLHxIf0wnix3rN9r8sew76RG8zozqwHlxTCq5wCuvw1USORzyA');
    
    List<dynamic> data = json.decode(response.body);
    results = data.map((report) => SliderReport(
      title: report['title']['rendered'],
      content: report['content']['rendered'],
      date: DateTime.parse(report['date']),
      reporter: report['meta']['morasel'],
      imageUrl: 'https://www.alweeam.com.sa/wp-content/uploads/2020/06/IMG-20200624-WA0080-150x150.jpg'
    )).toList();
    return results;
  }

  Future<void> getCategories() async{
    List<Category> cats = [];

    http.Response response = await http.get(categoriesURL);
    List<dynamic> data = json.decode(response.body);
    for(var category in data){
      List<SliderReport> catposts = await catPosts(category['id']);
      Category cat = new Category(
        id: category['id'],
        name: category['name'],
        description: category['description'],
        posts: catposts
      );
      cats.add(cat);
    }

    _categories = cats;
    isLoading = false;
    notifyListeners();
  }
}