import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaureateWidget extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String motivation;

  const LaureateWidget({
    super.key,
    this.firstname = "",
    this.lastname = "",
    required this.motivation,});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: Colors.grey,
              child : Padding(
                padding: const EdgeInsets.all(8.0),
                child : Text(
                  "$firstname $lastname",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              motivation,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
