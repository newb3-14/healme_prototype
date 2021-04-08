import 'package:flutter/material.dart';
import 'package:prototype/home/categories.dart';
import 'package:prototype/shared/appbar.dart';

import 'home_psy.dart';
import 'subtitle.dart';
import 'home_article.dart';
import 'home_header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Getting the display size
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(size: size),
            Subtitle("Articles", "Filter", "/article"),
            HomeArticle(),
            Subtitle("Recommendation", "See All", null),
            HomePsy(),
            Subtitle("Categories", "See All", null),
            Categories()
          ],
        ),
      ),
    );
  }
}
