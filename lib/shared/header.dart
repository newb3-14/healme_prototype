import 'package:flutter/material.dart';
import 'package:prototype/shared/constants.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        children: [
          Container(
            height: size.height * 0.05,
            decoration: BoxDecoration(color: kPrimaryColor),
          ),
          Container(
            height: size.height * 0.05,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: kBackgroundColor),
          )
        ],
      );
  }
}
