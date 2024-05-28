import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/film.dart';
import 'film_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var message = "Click on the button to launch the request.";
  final films = <Film>[];

  @override
  void initState() {
    super.initState();
    _initFilms();
  }

  Future<void> _initFilms() async {
    try {
      var response = await Film.fetchFilms();
      setState(() {
        if (response.isEmpty) message = "No films found";
        films.addAll(response);
      });
    } catch (error) {
      setState(() => message = error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("ex 5 : Ghibli films"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: films.isEmpty
            ? Column(children: [Center(child: Text(message))])
            : ListView.separated(
          itemCount: films.length,
          itemBuilder: (context, index) => FilmRow(film: films[index]),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
