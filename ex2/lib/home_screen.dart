import 'package:ex2/porpertyWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact list",
          style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 512.0,
            child: PopertyWidget(
              contract: 'Vente',
              type: 'Maison',
              m2: 120.0,
              nbChambre: 3,
              prix: 250000.0,
            ),
          ),

      ),
    );
  }
}
