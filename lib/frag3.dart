import 'package:flutter/material.dart';
import 'package:flutter_homework/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'db_helper.dart';
import 'items/taskitem.dart';

var taskItemList = List<TaskItem>();
var db = DBHelper.dbHelper;

class Frag3 extends StatefulWidget {
  @override
  _Frag3State createState() => _Frag3State();
}

class _Frag3State extends State<Frag3> {
  bool isFirstLoading = true;

  @override
  Widget build(BuildContext context) {
    taskItemList.clear();

    // if (db.allTasks.length == 0 && isFirstLoading) {
    //   db.getAllTask();
    //   isFirstLoading = !isFirstLoading;
    // }
    
    // db.inCompleteTasks.forEach((task) {
    //   setState(() {
    //     taskItemList.add(TaskItem(task,refreshFrag()));
    //   });
    // });

    if(Provider.of<AppProvider>(context).tasks != null && isFirstLoading){
      isFirstLoading = !isFirstLoading;
      Provider.of<AppProvider>(context).tasks.forEach((task) {
        setState(() {
          if(!task.isDone){
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