import 'package:flutter_homework/db_helper.dart';
import 'package:flutter_homework/models/const.dart';
import 'package:flutter_homework/models/task.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  Task task;
  Function refreshFun;
  TaskItem(this.task, [this.refreshFun]);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              child: Icon(Icons.delete_forever, color: Colors.red),
              onTap: () {
                DBHelper.dbHelper.deleteTask(widget.task);
                // setState(() {});
                // widget.refreshFun();
              }),
          Container(child: Text(widget.task.name)),
          Checkbox(
              value: widget.task.isDone,
              onChanged: (value) {
                widget.task.isDone = !widget.task.isDone;
                DBHelper.dbHelper.updateTask(widget.task);
                setState(() {});
                // widget.refreshFun();
              })
        ],
      ),
    );
  }
}
