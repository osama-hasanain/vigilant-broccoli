import 'package:flutter_homework/db_helper.dart';

class Task {
  String name;
  bool isDone;
  List<Map<String, dynamic>> fields;
  Task(this.name, this.isDone);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      DBHelper.TASK_NAME_COL: this.name,
      DBHelper.TASK_ISCOMPLETE_COL: this.isDone ? 1 : 0
    };
    return map;
  }
}
