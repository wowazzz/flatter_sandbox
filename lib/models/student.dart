class StudentModel {
  String name;
  int mark;

  StudentModel({
    this.name = '',
    this.mark = 0,
  });

  StudentModel.fromJson(Map<String, dynamic> json):
    name = json['name'] ?? '',
    mark = json['mark'] ?? 0;

  Map<String, dynamic> toJson() => {
    'name': name,
    'mark': mark,
  };
}
