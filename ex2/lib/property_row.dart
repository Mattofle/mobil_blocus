import 'package:ex2/property.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PropertyRow extends StatelessWidget {
  final Property property;
  const PropertyRow({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(property.type),
      subtitle: Text(
          '${property.contract} - ${property.m2} m2 - ${property.nbChambre} chambre(s) - ${property.prix} €'
      )
    );
  }
}
