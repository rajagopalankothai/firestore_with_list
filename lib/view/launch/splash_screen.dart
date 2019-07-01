import 'dart:async';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   startTime() async {
    var _duration = new Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }
  void navigationPage() {
  Navigator.of(context).pushReplacementNamed('/home');
}
@override
void initState() {
  super.initState();
  startTime();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/try1.png'),
      ),
      
    );
  }
}