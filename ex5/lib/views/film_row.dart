import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/film.dart';

class FilmRow extends StatelessWidget {
  final Film film;
  const FilmRow({
    super.key,
    required this.film,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(film.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Directed by ${film.director} - ${film.running_time} minutes"),
          Text("Release date: ${film.release_date}"),
          Text("Description: ${film.description}"),
          Text("Rotten Tomatoes score: ${film.rt_score}"),
        ],
      ),
    );
  }
}
