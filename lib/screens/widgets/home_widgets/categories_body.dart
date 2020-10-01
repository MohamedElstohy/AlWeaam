import 'package:flutter/material.dart';
import 'package:newspaper/models/slider_report.dart';
import 'package:provider/provider.dart';

import '../../category_screen.dart';

import '../../../providers/category_reports.dart';

import '../report_list_tile.dart';
import '../filter_button.dart';

class CategoriesBody extends StatefulWidget {
  @override
  _CategoriesBodyState createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody> {
  int _selectedIndex = 0;

  Column _newsField({List<SliderReport> elemnts , double deviceHeight , String type , int catId}){
    List<SliderReport> firstElements = elemnts.getRange(0, 8).toList();
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                type,
                style: TextStyle(
                  color: Color(0xFF003d99),
                  fontSize: 16,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                ),
              ),

              IconButton(
                icon: Icon(
                  Icons.calendar_view_day,
                  size: 30,
                  color: Color(0xFF003d99),
                ),
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        title: type,
                        elements: elemnts,
                        categoryId: 00,
                      ),
                    )
                  );
                },
              ),
            ],
          ),
        ),

        Column(
          children: 
            firstElements.map((e){
              return Column(
                children: <Widget>[
                  ReportListTile(
                    title: e.title,
                    imageUrl: e.imageUrl,
                    date: e.date,
                    deviceHeight: deviceHeight,
                  ),
                  SizedBox(height: 8,)
                ],
              );
            }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final reportsData = Provider.of<CategoryReports>(context);
    reportsData.getCategories();
    final categories = reportsData.categories;
    return Builder(
      builder: (_){
        if(reportsData.isLoading == true)
          return Center(child: CircularProgressIndicator(),);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 5),
            decoration: BoxDecoration(
              color: Color(0xFFFCFCFC),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: _width - 58,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context , index){
                            return FilterButton(
                              title: categories[index].name,
                              onPressed: (){
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                            );
                          },
                        ),
                      ),

                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: 35,
                        ),
                        onPressed: (){},
                      ),
                    ],
                  ),

                  Builder(
                    builder: (_) => _newsField(
                      deviceHeight: _height,
                      type: categories[_selectedIndex].name,
                      catId: categories[_selectedIndex].id,
                      elemnts: categories[_selectedIndex].posts
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}