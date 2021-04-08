import 'package:flutter/material.dart';
import 'package:prototype/journal/provider/journal_provider.dart';
import 'package:prototype/journal/widget/journal_list.dart';
import 'package:prototype/shared/appbar.dart';
import 'package:prototype/shared/header.dart';
import 'package:provider/provider.dart';

class JournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _journalData = Provider.of<JournalProvider>(context);
    final _journal = _journalData.items;
    return Scaffold(
      appBar: buildAppBar,
      body: Column(
        children: [
          Header(),
          Text("Journals", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: _journal[index],
                child: JournalList(
                  _journalData.items[index].id,
                ),
              ),
              itemCount: _journal.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: () {
          Navigator.of(context).pushNamed("/newJournal");
        },
      ),
    );
  }
}
