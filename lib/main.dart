import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './providers/home_reports.dart';
import './providers/category_reports.dart';

//SCREENS:
import './screens/home_screen.dart';
import './screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeReports(),
        ),
        ChangeNotifierProvider.value(
          value: CategoryReports(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'صحيفة الوئام',
        home: HomeScreen(),//SplashScreen()
        routes: {
          HomeScreen.routeName: (context) => HomeScreen()
        },
      ),
    );
  }
}
