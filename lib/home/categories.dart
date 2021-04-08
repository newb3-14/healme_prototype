import 'package:flutter/material.dart';
import 'package:prototype/shared/constants.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      child: GridView(
        padding: EdgeInsets.all(8),
        children: [
          Container(
            color: kBoxColor,
          ),
          Container(
            color: kBoxColor,
          ),
          Container(
            color: kBoxColor,
          ),
          Container(
            color: kBoxColor,
          ),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: size.width* 0.5,
            childAspectRatio:   2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
