import 'package:flutter_homework/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._();
  static var dbHelper = DBHelper._();
  static final DBNAME = 'tasks.db';
  static final TABLENAME = 'task';
  static final TASK_ID_COL = 'id';
  static final TASK_NAME_COL = 'name';
  static final TASK_ISCOMPLETE_COL = 'isColmplete';
  Database db;
  var allTasks = List<Task>();
  var completeTasks = List<Task>();
  var inCompleteTasks = List<Task>();

  Future<Database> initDB() async {
    if (db == null) {
      return await createDB();
    } else {
      return db;
    }
  }

  Future<Database> createDB() async {
    try {
      var dbPath = await getDatabasesPath();
      var path = join(dbPath, 'tasks.db');
      var db = await openDatabase(path, version: 1, onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $TABLENAME(
            $TASK_ID_COL INTEGER PRIMARY KEY AUTOINCREMENT,
            $TASK_NAME_COL TEXT NOT NULL,
            $TASK_ISCOMPLETE_COL INTEGER
          )
          ''');
      });
      return db;
    } on Exception catch (e) {
      print(e);
    }
  }

  insertNewTask(Task task) async {
    try {
      db = await initDB();
      var rowIndex = await db.insert(TABLENAME, task.toJson());
      print('Inserted In Index : $rowIndex');
    } catch (e) {
      print('Error : $e');
    }
  }

  deleteTask(Task task) async {
    try {
      db = await initDB();
      var rowIndex = await db.delete(TABLENAME,
          where: '$TASK_NAME_COL =?', whereArgs: [task.name]);
      print('Delete Task in Index : $rowIndex');
    } catch (e) {
      print('Error : $e');
    }
  }

  updateTask(Task task) async {
    try {
      db = await initDB();
      var rowIndex = await db.update(TABLENAME, task.toJson(),
          where: '$TASK_NAME_COL =?', whereArgs: [task.name]);
      print('Updated In Index : $rowIndex');
    } catch (e) {
      print('Error : $e');
    }
  }

  getAllTask() async {
    try {
      allTasks.clear();
      db = await initDB();
      var currentTask = await db.query(TABLENAME);
      var a = currentTask.forEach((taskAsMap) {
        var taskName = taskAsMap[DBHelper.TASK_NAME_COL];
        var taskIsDone = taskAsMap[DBHelper.TASK_ISCOMPLETE_COL] == 1 ? true : false;
        var task = Task(taskName, taskIsDone);
        allTasks.add(task);
        if (task.isDone) {
          completeTasks.add(task);
        } else {
          inCompleteTasks.add(task);
        }
      });
    } catch (e) {
      print('Error : $e ');
    }
  }
}
