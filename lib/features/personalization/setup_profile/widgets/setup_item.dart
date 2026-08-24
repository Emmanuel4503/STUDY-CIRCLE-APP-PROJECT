import 'package:flutter/material.dart';

class SetupItem extends StatelessWidget {
  const SetupItem({
    super.key,
    required this.text
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press for Primary School
      },
      child: Text(text),
    );
  }
}