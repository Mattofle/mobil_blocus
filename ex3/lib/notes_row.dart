import 'package:ex3/notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesRow extends StatelessWidget {
  final Note note;
  final Function onDelete;
  const NotesRow({
    super.key,
    required this.note,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.content),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          onDelete(note);
        },
      ),
    );
  }
}
