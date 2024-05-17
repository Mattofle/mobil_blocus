import 'package:flutter/cupertino.dart';

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
    return Column(
      children: [
        Text(motivation),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstname),
            SizedBox(width: 8), // This adds a small space between the firstname and lastname
            Text(lastname),
          ],
        ),
      ],
    );
  }
}
