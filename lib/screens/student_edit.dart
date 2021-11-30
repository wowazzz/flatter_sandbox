import 'package:flutter/material.dart';
// Import from project
import 'package:test/models/main.dart';

class StudentFormPage extends StatefulWidget {
  const StudentFormPage({Key? key}) : super(key: key);

  @override
  State<StudentFormPage> createState() => _StudentFormPage();
}

class _StudentFormPage extends State<StudentFormPage> {

  @override
  Widget build(BuildContext context) {
    StudentModel student = 
      ModalRoute.of(context)?.settings.arguments as StudentModel;
      
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/students');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
        ]
      ),
      body: Container(),
    );
  }
}
