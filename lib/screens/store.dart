import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/models/student.dart';

studentsSave(List<StudentModel> _) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> data = List.empty(growable: true);
  for(var st in _)
  {
    data.add(jsonEncode(st.toJson()));
  }
  await prefs.setStringList('students', data);
//  await prefs.setInt('countOfStudents', len);
}

Future<List<StudentModel>> studentsLoad() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var students = prefs.getStringList('students');
  return students == null ? [] : students.map((e) => StudentModel.fromJson(jsonDecode(e))).toList();
}

Future<int> getStudentsCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('students')?.length ?? 0;
}
