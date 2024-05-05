import 'package:note_app/model/task_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}tasks.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          print('creating a new one');
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title STRING, note TEXT, "
            "color INTEGER, "
            "isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<int> insert(TaskModel? task) async {
    print('insert function called');
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName); // SELECT * FROM tasks
  }

  static Future<int> delete(TaskModel task) async {
    print("deleted");
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }

  static Future<int> updateRow(int id) async {
    return await _db!.rawUpdate('''
    Update tasks
    Set isCompleted =?
    WHERE id =?
    ''', [1, id]);
  }

  static Future<int> updateRecord(TaskModel task) async {
    return await _db!.update(
      _tableName,
      task.toJson(),
      where: 'id= ?',
      whereArgs: [task.id], // ! id 0   // list data  0 1 2 3 4 5
    );
  }

  static Future<int> updateUnMarked(int id) async {
    return await _db!.rawUpdate('''
    Update tasks
    Set isCompleted =?
    WHERE id =?
    ''', [0, id]);
  }
}
