import 'package:flutter/material.dart';
import 'package:prototype/shared/side_scroll.dart';


//article part only
class HomeArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: SideScroll(100, 10)
    );
  }
}
