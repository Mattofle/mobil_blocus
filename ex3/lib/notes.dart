class Notes{
  final String title;
  final String content;

  Notes({
    required this.title,
    required this.content,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notes &&
          runtimeType == other.runtimeType &&
          title == other.title;

  @override
  int get hashCode => title.hashCode;
}