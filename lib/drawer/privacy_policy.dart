import 'package:flutter/material.dart';
import 'package:mytabsapp/view/home/homepage.dart';


class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage())),
        ),
      ),
      body: Center(
        child: Text('Privacy Policy Page'),
      ),
    );
  }
}
