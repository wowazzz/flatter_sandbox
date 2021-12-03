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

  @override
  initState() {
    super.initState();

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
    //String name = widget.student.name;
    //int mark = widget.student.mark;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('student Form'),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(
                  // return null if we just close it
                  null,
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.close,
                ),
              ),
            ),
          ]),
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
              initialValue: widget.student.name,
              onChanged: (_) => setState(() {
                widget.student.name = _;
              }),
            ),
            const Separator(),
            TextFormField(
                initialValue: '${widget.student.mark}',
                onChanged: (_) => setState(() {
                      widget.student.mark = int.tryParse(_) ?? 0;
                    })),
            const Separator(),
            MaterialButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(
                  widget.student,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
