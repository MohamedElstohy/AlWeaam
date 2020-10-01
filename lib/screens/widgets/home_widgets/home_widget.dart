import 'package:flutter/material.dart';
import 'package:newspaper/models/sorted_report.dart';
import 'package:provider/provider.dart';

import '../../category_screen.dart';

import '../../../providers/home_reports.dart';

import './../slider_widget.dart';
import './../report_list_tile.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>{
  // ReportsService get service => GetIt.I<ReportsService>();
  // APIResponse<List<SliderReport>> _apiResponse;
  // bool _isLoading = false;

  // _fetchReports() async{
  //     setState(() {
  //       _isLoading = true;
  //     });

  //     _apiResponse = await service.getNewsList();

  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }

  //   @override
  //   void initState() {
  //     super.initState();
  //     _fetchReports();
  //   }

  Container _newsField({List<SortedReport> elements , double deviceHeight , String type , Function firstTenElemnts , Function restElements}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Column(
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
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => CategoryScreen(
                    //       title: type,
                    //       elemnts: elements,
                    //     )                 
                    //   )
                    // );
                  },
                ),
              ],
            ),
          ),


          SizedBox(
            height: 10,
          ),
          // ListView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: elemnts.length,
          //   itemBuilder: (context , index) => ReportListTile(
          //         title: elemnts[index].title,
          //         imageUrl: elemnts[index].imageUrl,
          //         date: elemnts[index].date,
          //         deviceHeight: deviceHeight,
          //     ),
          // )

          Column(
            children: 
              elements.map((e){
                return Column(
                  children: <Widget>[
                    ReportListTile(
                      title: e.title,
                      imageUrl: e.imageUrl,
                      date: e.date,
                      deviceHeight: deviceHeight,
                    ),
                    SizedBox(height: 10,)
                  ],
                );
              }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final reportsData = Provider.of<HomeReports>(context);
    reportsData.getHomeReports();
    final sliderReports = reportsData.sliderList;
    final sortedReports = reportsData.sortedList;
    return Builder(
      builder: (_){
        if(reportsData.isLoading)
          return Center(child: CircularProgressIndicator(),);
        return RefreshIndicator(
          onRefresh: reportsData.getHomeReports,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFCFCFC),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Material(
                      elevation: 5,
                      child: Container(
                        height: _height/3,
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                        color: Colors.white12,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          scrollDirection: Axis.horizontal,
                          itemCount: sliderReports.length,
                          itemBuilder: (ctx , i) => SliderElement(
                            title: sliderReports[i].title,
                            imageurl: sliderReports[i].imageUrl,
                            deviceHeight: _height,
                            deviceWidth: _width,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    _newsField(
                      type: 'آخر الاخبار',
                      elements: sortedReports[0],
                      deviceHeight: _height
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    _newsField(
                      type: 'الأخبار المحلية',
                      elements: sortedReports[1],
                      deviceHeight: _height
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    _newsField(
                      type: 'أخبار دوليّة',
                      elements: sortedReports[2],
                      deviceHeight: _height
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    _newsField(
                      type: 'الأخبار الإقتصادية',
                      elements: sortedReports[3],
                      deviceHeight: _height
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    _newsField(
                      type: 'أخبار الرياضة',
                      elements: sortedReports[4],
                      deviceHeight: _height
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    _newsField(
                      type: 'منوعات',
                      elements: sortedReports[5],
                      deviceHeight: _height
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    _newsField(
                      type: 'مقالات الرأي',
                      elements: sortedReports[6],
                      deviceHeight: _height
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    _newsField(
                      type: 'اخبار المجتمع',
                      elements: sortedReports[7],
                      deviceHeight: _height
                    ),

                    SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}