import 'package:flutter/material.dart';
import 'cgpa.dart';
import 'myCard.dart';
import 'Results.dart';

class Gpa extends StatefulWidget {
  const Gpa({super.key});

  @override
  State<Gpa> createState() => _GpaState();
}

class _GpaState extends State<Gpa> {
  final List<MyCard> cards = [];
  int selectedIndex = 0;
  String subjectName = "", grade = "";
  double creditHours = 0;
  var subjectNameController = TextEditingController();
  var creditsController = TextEditingController();
  var gradeController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var gradeValues = {
    4.0: "A+",
    3.7: "A",
    3.3: "B+",
    3.0: "B",
    2.7: "C+",
    2.4: "C",
    2.2: "D+",
    2.0: "D",
    0.0: "F",
  };
  var valueGrades = {
    "A+": 4.0,
    "A": 3.7,
    "B+": 3.3,
    "B": 3.0,
    "C+": 2.7,
    "C": 2.4,
    "D+": 2.2,
    "D": 2.0,
    "F": 0.0,
  };

  void addCard() {
    if (creditHours != 0 && subjectName.isNotEmpty && grade.isNotEmpty) {
      setState(() {
        cards.add(MyCard(
          creditHours: creditHours,
          grade: grade,
          subjectName: subjectName,
          hours: true,
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
          'GPA Calculator',
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
              Icons.access_time,
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
              controller: subjectNameController,
              keyboardType: TextInputType.name,
              onFieldSubmitted: (value) {
                subjectName = value;
              },
              onChanged: (value) {
                subjectName = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Subject Name must not be empty';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Subject Name',
                prefixIcon: Icon(Icons.book),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownMenu(
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1.0, label: "1"),
                    DropdownMenuEntry(value: 2.0, label: "2"),
                    DropdownMenuEntry(value: 3.0, label: "3"),
                    DropdownMenuEntry(value: 4.0, label: "4"),
                    DropdownMenuEntry(value: 5.0, label: "5"),
                  ],
                  onSelected: (value) {
                    creditHours = value!;
                  },
                  hintText: 'Credits',
                  controller: creditsController,
                ),
                DropdownMenu(
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 4.0, label: "A+"),
                    DropdownMenuEntry(value: 3.7, label: "A"),
                    DropdownMenuEntry(value: 3.3, label: "B+"),
                    DropdownMenuEntry(value: 3.0, label: "B"),
                    DropdownMenuEntry(value: 2.7, label: "C+"),
                    DropdownMenuEntry(value: 2.4, label: "C"),
                    DropdownMenuEntry(value: 2.2, label: "D+"),
                    DropdownMenuEntry(value: 2.0, label: "D"),
                    DropdownMenuEntry(value: 0.0, label: "F"),
                  ],
                  onSelected: (value) {
                    grade = gradeValues[value]!;
                  },
                  hintText: 'Grade',
                  controller: gradeController,
                ),
              ],
            ),
            const SizedBox(
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
                  double gpa = 0.0, totalHours = 0;
                  for (int i = 0; i < cards.length; ++i) {
                    totalHours += cards[i].creditHours;
                  }
                  for (int i = 0; i < cards.length; ++i) {
                    if (cards[i].grade.isNotEmpty) {
                      gpa +=
                          cards[i].creditHours * valueGrades[cards[i].grade]!;
                    }
                  }
                  gpa /= totalHours;
                  if (totalHours == 0) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: const Color(0XFF88b4c6),
                          title: const Text(
                            "Total hours can't be zero",
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
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShowResults(type: 'GPA', gpa: gpa),
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
