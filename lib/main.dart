import 'package:flutter/material.dart';

import './view/./launch/splash_screen.dart';
import './theme/theme.dart';
import './view/./home/homepage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: 'skincare',
      routes: {
        '/home':(BuildContext context)=>HomePage(),
      },
      
      home: 
      SplashScreen(),
    );
  }
}
