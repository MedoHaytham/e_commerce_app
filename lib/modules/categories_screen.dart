import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
        ),
      ),
      body: Column(
        children:
        [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children:
              [
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
