import 'package:flutter/material.dart';
import 'package:prototype/article/article.dart';

class ArticleProvider with ChangeNotifier{
  
  List<Article> _items=[
    Article(
      title: "Lorem Ipsum",
      content: "#tags, #tags, #tags",
      url: "a",
    )
  ];
}