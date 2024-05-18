import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopertyWidget extends StatelessWidget {
  final String contract;
  final String type;
  final double m2;
  final int nbChambre;
  final double prix;

  const PopertyWidget({super.key,
    required this.contract,
    required this.type,
    required this.m2,
    required this.nbChambre,
    required this.prix});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(type),
      subtitle: Text('$contract - $m2 m2 - $nbChambre chambre(s) - $prix €'),
    );
  }
}
