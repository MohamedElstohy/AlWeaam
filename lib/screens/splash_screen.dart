import 'dart:async';

import 'package:flutter/material.dart';

import './home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation<Color> _animation;

  _SplashScreenState(){
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this
    );

    _animation = ColorTween(
      begin: Color(0xFFa6a6a6),
      end: Color(0xFF0059B3)
    ).animate(_controller)
    ..addListener(() {
      setState((){

      });
    });
    _controller.forward();
  }
  
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      (){
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _width,
          decoration: BoxDecoration(
            color: _animation.value
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'الوئام',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'صحيفة الوئام الالكترونية',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}