import 'package:flutter/material.dart';
// Import from project
import 'package:test/models/main.dart';
import 'package:test/screens/student_edit.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPage();
}

class _StudentsPage extends State<StudentsPage> {
  List<StudentModel> students = [];

  @override
  Widget build(BuildContext context) {
    // print(students);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (
          BuildContext context,
          int i,
        ) {
          return Container(
            margin: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 3)],
            ),
            height: 40,
            child: Row(
              children: [
                Text(students[i].name),
                Text(': ${students[i].mark}'),
                RawMaterialButton(
                  onPressed: () async {
                    try {
                      var _ = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StudentFormPage(
                            student: students[i],
                          ),
                        ),
                      ) as StudentModel;

                      print(students[i].mark);
                      setState(() {
                        //students[i].name = student.name;
                        //students[i].mark = student.mark;
                      });
                    } catch (_) {}
                  },
                  child: const Text('Edit'),
                ),
              ],
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            var student = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StudentFormPage(
                  student: StudentModel(),
                ),
              ),
            ) as StudentModel;

            print(student.name);
            setState(() {
              students.add(student);
            });
          } catch (_) {}
        },
        child: const Icon(
          Icons.add_box_rounded,
          size: 24,
        ),
      ),
    );
  }
}
