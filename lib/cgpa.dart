import 'package:flutter/material.dart';
import 'gpa.dart';

class Cgpa extends StatefulWidget {
  const Cgpa({super.key});

  @override
  State<Cgpa> createState() => _CgpaState();
}

class _CgpaState extends State<Cgpa> {
  int selectedIndex = 0, registeredSubjects = 0;
  String? subjectName;
  int? creditHours;
  var subjectNameController = TextEditingController();
  var creditsController = TextEditingController();
  var gradeController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF546f7a),
        centerTitle: true,
        title: const Text(
          'CGPA Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedFontSize: 20,
        unselectedFontSize: 18,
        currentIndex: selectedIndex,
        backgroundColor: const Color(0XFF546f7a),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => (selectedIndex == 1 ? Cgpa() : Gpa()),
            ),
          );
        },
        items: [
          BottomNavigationBarItem(
            label: 'GPA',
            icon: Icon(
              Icons.ac_unit,
            ),
          ),
          BottomNavigationBarItem(
            label: 'CGPA',
            icon: Icon(
              Icons.ac_unit,
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownMenu(
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 1.0, label: "1"),
                    DropdownMenuEntry(value: 2.0, label: "2"),
                    DropdownMenuEntry(value: 3.0, label: "3"),
                    DropdownMenuEntry(value: 4.0, label: "4"),
                    DropdownMenuEntry(value: 5.0, label: "5"),
                  ],
                  hintText: 'Credits',
                  controller: creditsController,
                ),
                DropdownMenu(
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 4.0, label: "Excellent"),
                    DropdownMenuEntry(value: 3.7, label: "Very Good"),
                    DropdownMenuEntry(value: 3.3, label: "Good"),
                    DropdownMenuEntry(value: 3.0, label: "Pass"),
                    DropdownMenuEntry(value: 2.7, label: "Weak"),
                    DropdownMenuEntry(value: 2.4, label: "Very Weak"),
                  ],
                  hintText: 'Grade',
                  controller: gradeController,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(3),
                color: const Color(0XFF546f7a),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Gpa(),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(3),
                color: const Color(0XFF546f7a),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Gpa(),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Registered Subjects: $registeredSubjects",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
