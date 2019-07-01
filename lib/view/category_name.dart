import 'package:flutter/material.dart';

import './details.dart';

class CategoryName extends StatelessWidget {
  final List categoryLists;
  final categoryName;
  final categoryPicture;
  final categoryIndex;

  CategoryName(
      {this.categoryName,
      this.categoryPicture,
      this.categoryLists,
      this.categoryIndex});
  @override
  Widget build(BuildContext context) {
    return Material(

      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Details(
                        categoryValue: categoryName,
                        categoryNames: categoryLists,

                      )));
        },
        child: Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 130.0,
              height: 130.0,
              decoration: BoxDecoration(
                shape: BoxShape.values[1],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(categoryPicture),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              categoryName,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: Theme.of(context).accentColor,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 10.0,)
          ],
        ),
      ),
    );
  }
}
