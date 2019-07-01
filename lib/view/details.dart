import 'package:flutter/material.dart';
import 'package:mytabsapp/add_new_qns.dart';

import '../view/./tabs/skin.dart';
import '../view/./tabs/hair.dart';
import '../view/./tabs/nail.dart';
import '../view/./tabs/makeup.dart';
import '../view/./tabs/perfume.dart';
import '../view/./tabs/general.dart';
import '../view/./home/homepage.dart';

class Details extends StatefulWidget {
  final String categoryValue;
  final List categoryNames;

  Details({this.categoryNames, this.categoryValue});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  TabController tabController;
  String _title = '';

  final _pages = [
    SkinPage(),
    HairPage(),
    NailPage(),
    MakeupPage(),
    PerfumePage(),
    GeneralPage()
  ];
  String _page1 = 'Skin';
  String _page2 = 'Hair';
  String _page3 = 'Nails';
  String _page4 = 'Make Up';
  String _page5 = 'Perfume';
  String _page6 = 'General Care';

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 6);
    tabController.addListener(() {
      setTitle(index: tabController.index);
    });

    _setInitialIndex();
  }

  void setTitle({int index}){
    String title = '';
    if(index == 0){
      title = _page1;
    } else if(index == 1){
      title = _page2;
    } else if(index == 2){
      title = _page3;
    }  else if(index == 3){
      title = _page4;
    }  else if(index == 4){
      title = _page5;
    }  else if(index == 5){
      title = _page6;
    } else {
      title = 'some name';
    }
    setState(() {
      _title = title;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _setInitialIndex() {
    if (widget.categoryValue == _page1) {
      tabController.index = 0;
      _title = _page1;
    } else if (widget.categoryValue == _page2) {
      tabController.index = 1;
      _title = _page2;
    } else if (widget.categoryValue == _page3) {
      tabController.index = 2;
      _title = _page3;
    } else if (widget.categoryValue == _page4) {
      tabController.index = 3;
      _title = _page4;
    } else if (widget.categoryValue == _page5) {
      tabController.index = 4;
      _title = _page5;
    } else if (widget.categoryValue == _page6) {
      tabController.index = 5;
      _title = _page6;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _tab1 = Tab(text: widget.categoryNames[0]['name']);

    Widget _tab2 = Tab(text: widget.categoryNames[1]['name']);
    Widget _tab3 = Tab(text: widget.categoryNames[2]['name']);
    Widget _tab4 = Tab(text: widget.categoryNames[3]['name']);
    Widget _tab5 = Tab(text: widget.categoryNames[4]['name']);
    Widget _tab6 = Tab(text: widget.categoryNames[5]['name']);
    final _myTabs = [_tab1, _tab2, _tab3, _tab4, _tab5, _tab6];
    final _pageNames = [_page1, _page2, _page3, _page4, _page5, _page6];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 14.0),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.home),
                iconSize: 35.0,
                color: Colors.white,
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomePage(),
                      ),
                    ),
              ),
            ),
          ),

        ],

        title: Center(
            child: Text(
          _title,
          style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal),
        )),
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: _myTabs,
          indicatorColor: Theme.of(context).bottomAppBarColor,
          labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              wordSpacing: 1.0,
              fontStyle: FontStyle.normal),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        child: Icon(Icons.add),
        elevation: 2.0,
        onPressed: () => _addnewquestions(context),
        tooltip: 'Add Questions',
      ),
    );
  }
}

_addnewquestions(BuildContext context) {
  showDialog(context: context, builder: (context) => AddNewQuestions());
}
