import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '\t\tthere is no weather😶 \n start searching now🔎',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
