import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String subjectName, grade;
  final double creditHours;

  const MyCard(
      {super.key,
      required this.subjectName,
      required this.grade,
      required this.creditHours});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0XFF9e9e9e),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subjectName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grade: $grade',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Hours: $creditHours',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
