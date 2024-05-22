import 'package:ex3/my_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notes.dart';
import 'notes_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void deleteNote(Note note) {
    setState(() {
      defaultNotes.remove(note);
    });
  }

  void addNote (Note note) {
    setState(() {
      defaultNotes.add(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayedNotes = defaultNotes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child : ListView.separated(
                itemCount: displayedNotes.length,
                itemBuilder: (context, index) =>
                    NotesRow(note: displayedNotes[index], onDelete: deleteNote,
                    ), separatorBuilder: (BuildContext context, int index) { return const Divider();},
              ),
              ),
              MyForm(addNote: addNote),
            ],
          )
        ),
      )
    );
  }
}
