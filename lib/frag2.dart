import 'package:flutter/material.dart';
import 'package:flutter_homework/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'db_helper.dart';
import 'items/taskitem.dart';

var taskItemList = List<TaskItem>();
var db = DBHelper.dbHelper;

class Frag2 extends StatefulWidget {
  @override
  _Frag2State createState() => _Frag2State();
}

class _Frag2State extends State<Frag2> {
  bool isFirstLoading = true;

  @override
  Widget build(BuildContext context) {
    taskItemList.clear();

    // if (db.allTasks.length == 0 && isFirstLoading) {
    //   db.getAllTask();
    //   isFirstLoading = !isFirstLoading;
    // }
    
    // db.completeTasks.forEach((task) {
    //   setState(() {
    //     taskItemList.add(TaskItem(task,refreshFrag()));
    //   });
    // });

    
    if(Provider.of<AppProvider>(context).tasks != null && isFirstLoading){
      isFirstLoading = !isFirstLoading;
      Provider.of<AppProvider>(context).tasks.forEach((task) {
        setState(() {
          if(task.isDone){
          taskItemList.add(TaskItem(task, refreshFrag()));
          }
        });
      });
      Provider.of<AppProvider>(context).tasks.forEach((task) {
        print(task.name.toString());
      });
    }

    return Container(child: SingleChildScrollView(child: Column(children: taskItemList)));
  }

   refreshFrag(){
    setState(() {});
  }
}