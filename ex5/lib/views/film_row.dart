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
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Image.network(film.image, width: 100),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(film.release_date),
                  const Divider(),
                  Text(film.title, style: Theme.of(context).textTheme.headline6),
                  const Divider(),
                  Text("${film.rt_score}%",
                        style: TextStyle(
                          color: int.parse(film.rt_score) > 75
                              ? Colors.green
                              : int.parse(film.rt_score) > 50
                              ? Colors.orange
                              : Colors.red,
                        ),
                  ),
                  const Divider(),
                  Text("Directed by ${film.director} - ${film.running_time} minutes"),
                  const Divider(),
                  Text(film.description,textAlign: TextAlign.justify,
                    softWrap: true,),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
