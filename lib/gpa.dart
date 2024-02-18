import 'package:flutter/material.dart';
import 'cgpa.dart';

class Gpa extends StatefulWidget {
  const Gpa({super.key});

  @override
  State<Gpa> createState() => _GpaState();
}

class _GpaState extends State<Gpa> {
  int selectedIndex = 0, registeredSubjects = 0;
  String? subjectName;
  int? creditHours;
  var subjectNameController = TextEditingController();
  var creditsController = TextEditingController();
  var gradeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List<Widget> pages = [
    const Gpa(),
    const Cgpa(),
  ];

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
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: subjectNameController,
              keyboardType: TextInputType.name,
              onFieldSubmitted: (value) {},
              onChanged: (value) {},
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
