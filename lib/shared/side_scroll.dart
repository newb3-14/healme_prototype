import 'package:flutter/material.dart';

import 'package:prototype/shared/constants.dart';

//sidescroll for homescreen
class SideScroll extends StatelessWidget {
  final double width;
  final double height;

  SideScroll(this.width, this. height);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            color: kBoxColor,
            width: width,
            height: height,
            margin: EdgeInsets.all(5),
          );
        });
  }
}
