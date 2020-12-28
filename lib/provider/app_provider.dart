import 'package:flutter/cupertino.dart';
import 'package:flutter_homework/models/task.dart';

class AppProvider extends ChangeNotifier {
List<Task> tasks ;
setValue(List<Task> tasks){
  this.tasks = tasks;
  print(tasks);
  notifyListeners();
}
}