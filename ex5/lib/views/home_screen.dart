import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var message = "Click on the button to launch the request.";

  @override
  void initState() {
    super.initState();
    _initFilm();
  }

  Future<void> _initFilm() async {
    const url = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films/";
    try {
      setState(() => message = "Loading, please wait…");
      await Future.delayed(Duration(seconds: 3));// Uncompleted
      var response = await http.get(Uri.parse(url));
      setState(() => message = response.body); // Completed with a value
    } catch (error) {
      setState(() => message = error.toString()); //Completed with an error
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
        child: SingleChildScrollView(
          child: Column(
            children:[
              Text(message),
            ]
          ),
        ),
      ),
    );
  }
}
