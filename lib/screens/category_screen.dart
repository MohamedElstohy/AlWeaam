import 'package:flutter/material.dart';
import 'package:newspaper/models/slider_report.dart';
import 'package:provider/provider.dart';

import './widgets/report_list_tile.dart';

import '../providers/category_reports.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  final int categoryId;
  final List<SliderReport> elements; 

  CategoryScreen({
    @required this.title,
    @required this.categoryId,
    @required this.elements,
  });

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    // final cat = Provider.of<CategoryReports>(context).categories.where((element) => element.id == widget.categoryId).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF003d99),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          color: Color(0xFFFCFCFC),
          child: ListView.builder(
            itemCount: widget.elements.length,
            itemBuilder: (context , index){
              return Column(
                children: <Widget>[
                  ReportListTile(
                    title: widget.elements[index].title,
                    imageUrl: widget.elements[index].imageUrl,
                    date: widget.elements[index].date,
                    deviceHeight: _deviceHeight,
                  ),

                  SizedBox(height: 10,),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}