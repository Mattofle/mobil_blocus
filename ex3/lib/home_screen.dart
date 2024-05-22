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

  @override
  Widget build(BuildContext context) {
    final displayedNotes = defaultNotes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Container(
        child: ListView.separated(
          itemCount: displayedNotes.length,
          itemBuilder: (context, index) =>
              NotesRow(note: displayedNotes[index], onDelete: deleteNote,
        ), separatorBuilder: (BuildContext context, int index) { return const Divider();},
      ),
      )
    );
  }
}
