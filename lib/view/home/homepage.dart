import 'package:flutter/material.dart';
import 'package:mytabsapp/drawer/terms_conditions.dart';
import 'package:mytabsapp/view/accounts/open_drawer.dart';

import '../categories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //x Future.delayed(Duration.zero, () =>_termsandcontions(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title:
            Container(padding: EdgeInsets.only(left: 25.0,right: 25.0),
              child: Center(child: Text('All Categories'))),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
      ),
      drawer: OpenDrawer(),
      body: Container(
        padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 20.0),
        child: Categories(),
      ),
    );

  }
}

void _termsandcontions(BuildContext context) {
  showDialog(context: context, builder: (context) => TermsOfUse());
}
