import 'package:flutter_homework/db_helper.dart';
import 'package:flutter_homework/home.dart';
import 'package:flutter_homework/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/provider/app_provider.dart';
import 'package:provider/provider.dart';

Task task = Task('', false);

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [addTask(context)],
        ),
      ),
    );
  }

  Widget addTask(var context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 50, 20, 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter New Task',
          labelText: 'Enter New Task Please',
          fillColor: Colors.blue[100],
          suffixIcon: Checkbox(
              value: task.isDone,
              onChanged: (value) {
                task.isDone = !task.isDone;
                setState(() {});
              }),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan),
              borderRadius: BorderRadius.circular(20)),
        ),
        onSubmitted: (value) {
          task.name = value;
          DBHelper.dbHelper.insertNewTask(task);
          DBHelper.dbHelper.getAllTask().then((value) {
            DBHelper.dbHelper.getAllTask();
            Provider.of<AppProvider>(context, listen: false)
                .setValue(DBHelper.dbHelper.allTasks);
            Route route = MaterialPageRoute(builder: (context) => Home());
            Navigator.pushReplacement(context, route);
          });
        },
      ),
    );
  }
}
