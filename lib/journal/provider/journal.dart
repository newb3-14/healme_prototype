import 'package:flutter/material.dart';


class Journal with ChangeNotifier {
  String id;
  String title;
  String content;
  DateTime date;

  Journal ({this.id, this.title, this.content, this.date});
}