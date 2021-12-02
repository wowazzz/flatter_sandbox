import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// Import from project
import 'package:test/models/main.dart';
import 'package:test/screens/store.dart';
import 'package:test/screens/student_edit.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPage();
}

class _StudentsPage extends State<StudentsPage> {
  List<StudentModel> _students = [];
  
  List<StudentModel> get students => _students;
  set students(List<StudentModel> _) {
    studentsSave(_);
    _students = _;
  }

  @override
  initState() {
    super.initState();
    studentsLoad().then((value) => setState(() => _students = value));
  }

  showAction(context, StudentModel student) {
    showModalBottomSheet(
      builder: (_) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(onPressed: () {}, child: Text('Edit')),
            CupertinoActionSheetAction(onPressed: () {
              students.remove(student);
              setState(() {
                
              });
              Navigator.of(context).pop();
            }, child: Text('Remove')),
          ]
        );
      },
     context: context);
  }

  @override
  Widget build(BuildContext context) {
    // print(students);
    return FutureBuilder<int>(
      future: getStudentsCount(),
      builder: (_, AsyncSnapshot snapshot) => Scaffold(
      appBar: AppBar(
        title: Text('Students ${snapshot.data}'),
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
                  onPressed: () => showAction(context, students[i]), /* async {
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
                  }*/
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
      ),
    );
  }
}
