import 'package:flutter/material.dart';
import 'Results.dart';
import 'gpa.dart';
import 'myCard.dart';

class Cgpa extends StatefulWidget {
  const Cgpa({super.key});

  @override
  State<Cgpa> createState() => _CgpaState();
}

class _CgpaState extends State<Cgpa> {
  int selectedIndex = 0, registeredSubjects = 0;
  final List<MyCard> cards = [];

  String semester = '', sGpa = '';
  double gpa = 0;
  var semesterController = TextEditingController();
  var semesterGpaControl = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void addCard() {
    if (sGpa.isNotEmpty && semester.isNotEmpty) {
      gpa = double.parse(sGpa);
      setState(() {
        cards.add(MyCard(
          subjectName: semester,
          creditHours: 0,
          grade: gpa.toString(),
          hours: false,
        ));
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0XFF88b4c6),
            title: const Text(
              "All fields are required",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

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
              builder: (context) =>
                  (selectedIndex == 1 ? const Cgpa() : const Gpa()),
            ),
          );
        },
        items: const [
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
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: semesterController,
              keyboardType: TextInputType.name,
              onFieldSubmitted: (value) {
                semester = value;
              },
              onChanged: (value) {
                semester = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Semester must not be empty';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Semester',
                prefixIcon: Icon(Icons.book),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: semesterGpaControl,
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                sGpa = value;
              },
              onChanged: (value) {
                sGpa = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'GPA must not be empty';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'GPA',
                prefixIcon: Icon(Icons.book),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
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
                  addCard();
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
                  double cgpa = 0.0, numOfSemesters = 0;
                  for (int i = 0; i < cards.length; ++i) {
                    numOfSemesters++;
                    cgpa += double.parse(cards[i].grade);
                  }
                  cgpa /= numOfSemesters;
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShowResults(type: 'CGPA', gpa: cgpa),
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
            for (int i = 0; i < cards.length; ++i) cards[i]
          ],
        ),
      ),
    );
  }
}
