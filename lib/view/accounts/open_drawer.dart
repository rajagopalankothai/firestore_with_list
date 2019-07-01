import 'package:flutter/material.dart';
import 'package:mytabsapp/drawer/about.dart';
import 'package:mytabsapp/drawer/privacy_policy.dart';
import 'package:mytabsapp/drawer/sponsers.dart';
import 'package:mytabsapp/drawer/terms_conditions.dart';




class OpenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Icon(Icons.account_box)),
          InkWell(
            onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>About())),
            child: const
            ListTile(
              leading: Icon(Icons.label_outline),
              title: Text('About'),
            ),
          ),
          InkWell(
            onTap: ()  =>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Sponsors())),
            child: const ListTile(
              leading: Icon(Icons.supervisor_account),
              title: Text('Sponsors'),
            ),
          ),
          InkWell(
            onTap: ()  =>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TermsOfUse())),
            child: const ListTile(
              leading: Icon(Icons.calendar_view_day),
              title: Text('Terms of Use'),
            ),
          ),
          InkWell(
            onTap: ()  =>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>PrivacyPolicy())),
            child: const ListTile(
              leading: Icon(Icons.list),
              title: Text('Privacy Policy'),
            ),
          ),
        ],
      ),
    );
  }
}
