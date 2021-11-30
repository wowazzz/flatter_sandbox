import 'package:flutter/material.dart';
// Import from project
import 'package:test/models/main.dart';

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
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
          )
        ],
        title: const Text('Students'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var s = await Navigator.of(context).pushNamed(
            '/students/crud',
            arguments: StudentModel(name: 'Old name', mark: 5),
            ) as StudentModel;
          
          print(s.name);
        },
        child: const Icon(
          Icons.add_box_rounded,
          size: 24,
        )
      ),
    );
  }
}
