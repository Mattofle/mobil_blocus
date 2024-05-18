import 'package:flutter/cupertino.dart';

class Property extends StatelessWidget {
  final String contract;
  final String type;
  final double m2;
  final int nbChambre;
  final double prix;

  const Property({
    super.key,
    required this.contract,
    required this.type,
    required this.m2,
    required this.nbChambre,
    required this.prix,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

List<Property> _createProperties() {
  return [
    Property(
      contract: 'Vente',
      type: 'Maison',
      m2: 120.0,
      nbChambre: 3,
      prix: 250000.0,
    ),
    Property(
      contract: 'Location',
      type: 'Appartement',
      m2: 60.0,
      nbChambre: 2,
      prix: 800.0,
    ),
    Property(
      contract: 'Vente',
      type: 'Terrain',
      m2: 1000.0,
      nbChambre: 0,
      prix: 150000.0,
    ),
    Property(
      contract: 'Location',
      type: 'Bureau',
      m2: 50.0,
      nbChambre: 0,
      prix: 500.0,
    ),
  ];
}
