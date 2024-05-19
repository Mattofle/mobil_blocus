import 'package:ex2/property.dart';
import 'package:ex2/porpertyWidget.dart';
import 'package:ex2/property_row.dart';
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
    final displayedProperties = defaultProperties;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact list",
          style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
          child: Center(
          child: SizedBox(
            width: 512.0,
            child: ListView.separated(
              itemCount: displayedProperties.length,
              itemBuilder: (context, index) =>
                  PropertyRow(property: displayedProperties[index]), separatorBuilder: (BuildContext context, int index) { return Divider();},
            ),
          ),
        ),

      ),
    );
  }
}
