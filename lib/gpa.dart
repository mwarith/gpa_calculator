import 'package:flutter/material.dart';

class Gpa extends StatelessWidget {
  const Gpa({super.key});

  final int _selectedIconBar = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF546f7a),
        centerTitle: true,
        title: const Text(
          'GPA Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'vdv',
            icon: Icon(
              Icons.ac_unit_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
