import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:prototype/journal/provider/journal_provider.dart';
import 'provider/journal.dart';

class NewJournal extends StatefulWidget {
  @override
  _NewJournalState createState() => _NewJournalState();
}

class _NewJournalState extends State<NewJournal> {
  var _editedJournal = Journal(title: "", content: "");
  var _formKey = GlobalKey<FormState>();
  var _isinit = true;
  var _initvalue = {
    "title": "",
    "content": "",
    "date": null,
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isinit) {
      final journalId = ModalRoute.of(context).settings.arguments as String;
      if (journalId != null) {
        _editedJournal = Provider.of<JournalProvider>(context, listen: false)
            .findById(journalId);
        _initvalue = {
          "title": _editedJournal.title,
          "content": _editedJournal.content,
        };
      }
    }
    _isinit = false;
  }

  void _datePicker () {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _editedJournal.date = value;
      });
      print(_editedJournal.date.toString());
    });
  }

  void _saveJournal() {
    final _isValid = _formKey.currentState.validate();
    if (!_isValid) {
      return;
    }
    _formKey.currentState.save();
    if (_editedJournal.id != null) {
      Provider.of<JournalProvider>(context, listen: false)
          .editJournal(_editedJournal.id, _editedJournal);
    } else {
      Provider.of<JournalProvider>(context, listen: false)
          .addNewJournal(_editedJournal);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "New Journal",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
              onPressed: () => _saveJournal(),
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  initialValue: _initvalue["title"],
                  decoration: InputDecoration(labelText: "Title"),
                  onChanged: (value) {
                    _editedJournal = Journal(
                      id: _editedJournal.id,
                      title: value,
                      content: _editedJournal.content,
                      date: _editedJournal.date,
                    );
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please input a title";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  initialValue: _initvalue["content"],
                  decoration:
                      InputDecoration(labelText: "What did you do today?"),
                  maxLines: 3,
                  onChanged: (value) {
                    _editedJournal = Journal(
                      id: _editedJournal.id,
                      title: _editedJournal.title,
                      content: value,
                      date: _editedJournal.date,
                    );
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please input a content";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 79,
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: _datePicker,
                        ),
                    Text(_editedJournal.date == null
                        ? "No date choosen"
                        : DateFormat.yMMMEd().format(_editedJournal.date))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
