import 'package:flutter/material.dart';
import 'package:test/components/separator.dart';
// Import from project
import 'package:test/models/main.dart';

class StudentFormPage extends StatefulWidget {
  final StudentModel student;

  const StudentFormPage({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  State<StudentFormPage> createState() => _StudentFormPage();
}

class _StudentFormPage extends State<StudentFormPage> {

//  TextEditingController name = TextEditingController();
//  TextEditingController mark = TextEditingController();
  String name = 'default';
  int mark = 5;

  @override
  initState() {
    super.initState();

    name = widget.student.name;
    mark = widget.student.mark;
/*
    name.addListener(() {
      //print(name.value.text);
    });

    mark.addListener(() {
      //print(mark.value.text);
     });
*/
  }

  @override
  void dispose() {
//    name.dispose();
//    mark.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.student.mark);
      
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('student Form'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(
                StudentModel(
                  name:'Jane',
                  mark: 5,
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.close,
              ),
            ),
          ),
        ]
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset.zero,
              blurRadius: 2,
              spreadRadius: 3.0,
            ),
          ],
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: name,
                onChanged: (_) => setState(() {
                  name = _;
                }),
              ),
              const Separator(),
              TextFormField(
                initialValue: '$mark',
                onChanged: (_) => setState(() {
                mark = int.parse(_);
              })),
              const Separator(),
              MaterialButton(
                child: const Text('Save'),
                onPressed: () {
                  Navigator.of(context).pop(
                    StudentModel(
                      name: name,
                      mark: mark
                    ),
                  );
                },
              ),
            ],
          ),
      ),
    );
  }
}
