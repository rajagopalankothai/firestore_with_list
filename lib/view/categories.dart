import 'package:flutter/material.dart';

import './category_name.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _myCategories = [
      {
        "name": "Skin",
        "picture": "assets/skin.jpg",
      },
      {
        "name": "Hair",
        "picture": "assets/skin.jpg",
      },
      {
        "name": "Nails",
        "picture": "assets/skin.jpg",
      },
      {
        "name": "Make Up",
        "picture": "assets/makeup.jpg",
      },
      {
        "name": "Perfume",
        "picture": "assets/scent.jpeg",
      },
      {
        "name": "General Care",
        "picture": "assets/general.jpg",
      }
    ];

    return GridView.builder(
        itemCount: _myCategories.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return CategoryName(
            categoryName: _myCategories[index]["name"],
            categoryPicture: _myCategories[index]["picture"],
            categoryLists: _myCategories,
            categoryIndex: _myCategories[index],
          );
        });
  }
}
