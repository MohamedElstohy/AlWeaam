import 'package:flutter/material.dart';

class BookMarkBody extends StatefulWidget {
  @override
  _BookMarkBodyState createState() => _BookMarkBodyState();
}

class _BookMarkBodyState extends State<BookMarkBody> {
  List<String> _markedNews = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: _markedNews.isEmpty 
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'لا توجد اخبار محفوظة حاليا',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w800,
                ),
              ),
          ],
        )
        : ListView(),
    );
  }
}