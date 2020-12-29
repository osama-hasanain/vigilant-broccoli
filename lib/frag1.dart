import 'package:flutter_homework/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/models/task.dart';
import 'package:flutter_homework/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'items/taskitem.dart';

var taskItemList = List<TaskItem>();
var db = DBHelper.dbHelper;

class Frag1 extends StatefulWidget {
  @override
  _Frag1State createState() {
    return _Frag1State();
  }
}

class _Frag1State extends State<Frag1> {
  bool isFirstLoading = true;

  @override
  Widget build(BuildContext context) {
    taskItemList.clear();

    // if (db.allTasks.length == 0 && isFirstLoading) {
    //   db.getAllTask();
    //   isFirstLoading = !isFirstLoading;
    // }

    if(Provider.of<AppProvider>(context).tasks != null && isFirstLoading){
      isFirstLoading = !isFirstLoading;
      Provider.of<AppProvider>(context).tasks.forEach((task) {
        setState(() {
          taskItemList.add(TaskItem(task, refreshFrag()));
        });
      });
      Provider.of<AppProvider>(context).tasks.forEach((task) {
        print(task.name.toString());
      });
    }

    // db.allTasks.forEach((task) {
    //   setState(() {
    //     taskItemList.add(TaskItem(task, refreshFrag()));
    //   });
    // });
     

    return ChangeNotifierProvider(
      create: (context) {
        return AppProvider();
      },
          child: Container(
          child: SingleChildScrollView(child: Column(children: taskItemList))),
    );
  }

  refreshFrag() {
    setState(() {});
  }
}