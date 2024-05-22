class Note{
  final String title;
  final String content;

  Note({
    required this.title,
    required this.content,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Note &&
          runtimeType == other.runtimeType &&
          title == other.title;

  @override
  int get hashCode => title.hashCode;
}

List<Note> _createNotes() {
  return [
    Note(
      title: 'Note 1',
      content: 'Content of note 1',
    ),
    Note(
      title: 'Note 2',
      content: 'Content of note 2',
    ),
    Note(
      title: 'Note 3',
      content: 'Content of note 3',
    ),
    Note(
      title: 'Note 4',
      content: 'Content of note 4',
    ),
  ];
}

final defaultNotes = _createNotes();