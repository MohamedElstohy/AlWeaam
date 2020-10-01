import 'package:flutter/material.dart';

class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  int _groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Color(0xFFFCFCFC),
        padding: EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 7,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'خصائص الاعدادات',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25,),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _groupValue,
                        onChanged: (T){
                          setState(() {
                            _groupValue = T;
                          });
                        },
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _groupValue = 1;
                          });
                        },
                        child: Text(
                          'السماح باستقبال الاشعارات بشكل يومي',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Radio(
                        value: 2,
                        groupValue: _groupValue,
                        onChanged: (T){
                          setState(() {
                            _groupValue = T;
                          });
                        },
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _groupValue = 2;
                          });
                        },
                        child: Text(
                          'عدم استقبال الاشعارات بشكل يومي',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ],
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