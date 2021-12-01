import 'package:flutter/material.dart';
// Import from project
import 'package:test/models/main.dart';
import 'package:test/screens/main.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPage();
}

class _StudentsPage extends State<StudentsPage> {
  List<StudentModel> students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (
            BuildContext context,
            int i,
          ) {
            return Container(
              color: Colors.white,
              //decoration: const BoxDecoration(boxShadow)
              height: 40,
              child: Text(
                  students[i].name
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(
          () async {
            try {
              students.add(await Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => StudentFormPage(
                    student: StudentModel(),
                  ),
                ),
              ));
              print(students.length);
            } catch(_) {}
          },
        ),
        child: const Icon(
          Icons.add_box_rounded,
          size: 24,
        ),
      ),
    );
  }
}
