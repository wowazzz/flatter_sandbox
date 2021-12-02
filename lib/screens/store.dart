import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/models/student.dart';

studentsSave(List<StudentModel> _) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> data = List.empty();
  for(var st in _)
  {
    data.add(jsonEncode(st.toJson()));
  }
  prefs.setStringList('students', data);
//  await prefs.setInt('countOfStudents', len);
}

Future<List<StudentModel>> studentsLoad() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var students = prefs.getStringList('students');
  return students!.map((e) => StudentModel.fromJson(jsonDecode(e))) as List<StudentModel>;
}

Future<int> getStudentsCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('students')?.length ?? 0;
}
