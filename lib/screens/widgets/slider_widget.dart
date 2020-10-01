import 'package:flutter/material.dart';

class SliderElement extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;
  final String imageurl;
  final String title;

  SliderElement({
    @required this.deviceWidth,
    @required this.deviceHeight,
    @required this.title,
    @required this.imageurl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageurl,
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.2,
          color: Colors.grey
        )
      ),
      width: deviceWidth - 70,
      height: (deviceHeight/3) - 10,
      margin: EdgeInsets.only(left: 15,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.blue,
                fontFamily: 'Cairo',
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}