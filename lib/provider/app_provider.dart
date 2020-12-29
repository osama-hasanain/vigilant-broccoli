import 'package:flutter_homework/models/task.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
List<Task> tasks ;
setValue(List<Task> tasks){
  this.tasks = tasks;
  print(tasks);
  notifyListeners();
}
}