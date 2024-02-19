import 'package:flutter/material.dart';

class ShowResults extends StatelessWidget {
  final String type;
  final double gpa;

  const ShowResults({super.key, required this.type, required this.gpa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your $type is \n${gpa.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
