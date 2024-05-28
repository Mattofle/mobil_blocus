import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Film{
  static const baseUrl = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films/";

  final String id;
  final String title;
  final String image;
  final String description;
  final String release_date;
  final String director;
  final String running_time;
  final String rt_score;

  const Film(this.id, this.title, this.image, this.description, this.release_date, this.director, this.running_time, this.rt_score);

  Film.fromJson(Map<String, dynamic> jsonObj)
      : this(
    jsonObj["id"],
    jsonObj["title"],
    jsonObj["image"],
    jsonObj["description"],
    jsonObj["release_date"],
    jsonObj["director"],
    jsonObj["running_time"],
    jsonObj["rt_score"],
  );


  static Future<List<Film>> fetchFilms() async {
    var response = await http.get(Uri.parse("$baseUrl"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movies");
    }

    return compute((input) {
      final jsonList = jsonDecode(input);
      return jsonList.map<Film>((jsonObj) => Film.fromJson(jsonObj)).toList();
    }, response.body);
  }
}