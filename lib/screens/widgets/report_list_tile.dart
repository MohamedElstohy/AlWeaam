import 'package:flutter/material.dart';

class ReportListTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final DateTime date;
  final double deviceHeight;

  ReportListTile({
    @required this.title,
    @required this.imageUrl,
    @required this.date,
    @required this.deviceHeight,
  });

  String dateToString(DateTime date){
    return '${date.day} / ${date.month} / ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        height: deviceHeight/8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.1,
            color: Colors.grey
          )
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover
                ),
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                    child: Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w800,        
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    child: Text(
                      dateToString(date),
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w800,
                        color: Colors.grey     
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}