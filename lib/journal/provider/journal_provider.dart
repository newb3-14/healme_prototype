import 'package:flutter/material.dart';

import 'journal.dart';

class JournalProvider with ChangeNotifier {
  List<Journal> _items = [
    Journal(
      id: "jn1",
      title: "My day",
      content: "My lovely day",
    ),
    Journal(
      id: "jn2",
      title: "Today is wonderful",
      content: "Today I have really wonderful day",
    )
  ];

  List<Journal> get items{
    return [..._items];
  }

  Journal findById(String id){
    return _items.firstWhere((journal) => journal.id == id);
  }  

  void addNewJournal(Journal journal){
    final newJournal = Journal(
      content: journal.content,
      title: journal.title,
      id: DateTime.now().toString(),
      date: journal.date,
    );
    _items.add(newJournal);
    notifyListeners();
  }

  void editJournal(String id, Journal editedJournal){
    final journalIndex =_items.indexWhere((jn) => jn.id == id);
      _items[journalIndex] = editedJournal;
      notifyListeners();
      print("...");
  }
}
