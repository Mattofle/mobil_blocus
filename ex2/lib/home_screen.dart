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
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    final displayedProperties = _switchValue ? defaultProperties.where((property) => property.contract == 'Vente').toList() : defaultProperties.where((property) => property.contract == 'Location').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact list",
          style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
          child: Center(
          child: Column(
            children: [
              SwitchListTile(
                  title: const Text("Afficher les propriétés à vendre"),
                  value: _switchValue,
                  onChanged: (vlaue) {
                setState((){
                  _switchValue = !_switchValue;
                });
                  }),
              Expanded(
                child: SizedBox(
                  width: 512.0,
                  child: ListView.builder(
                    itemCount: displayedProperties.length,
                    itemBuilder: (context, index) =>
                        PropertyRow(property: displayedProperties[index]),
                  ),
                ),
              ),
            ]
          )
        ),

      ),
    );
  }
}
