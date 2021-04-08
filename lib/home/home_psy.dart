import 'package:flutter/material.dart';
import 'package:prototype/shared/side_scroll.dart';

//Psy part only
class HomePsy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: SideScroll(45, 25),
    );
  }
}