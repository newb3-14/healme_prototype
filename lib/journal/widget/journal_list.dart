import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:prototype/journal/provider/journal.dart';

class JournalList extends StatelessWidget {
  final String id;
  JournalList(this.id);
  @override
  Widget build(BuildContext context) {
    final jn = Provider.of<Journal>(context);

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: ListTile(
        contentPadding: EdgeInsets.all(20),
        onTap: () {
          Navigator.of(context).pushNamed("/newJournal", arguments: id);
        },
        trailing: Text(jn.date == null ? "No date" : DateFormat.yMEd().format(jn.date)),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10),
          child: Text(
            jn.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        subtitle: Text(jn.content),
      ),
    );
  }
}
