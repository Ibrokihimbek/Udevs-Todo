import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

class LocalDatabase {
  static String tableName = "todoTable";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDB("todo.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";
        String intType = "INTEGER";
        String boolType = "INTEGER";

        await db.execute('''
        CREATE TABLE $tableName (
            ${TodoFields.id} $idType,
            ${TodoFields.title} $textType, 
            ${TodoFields.description} $textType, 
            ${TodoFields.date} $textType,
            ${TodoFields.categoryId} $intType,
            ${TodoFields.isCompleted} $boolType,
            ${TodoFields.createdAt} $textType
            )
            ''');
      },
    );
    return database;
  }

  static Future<TodoModel> insertToDatabase(TodoModel newTodo) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, newTodo.toJson());
    debugPrint("TASK ADDED");
    return newTodo.copyWith(id: id);
  }

  static Future<TodoModel> updateTaskById(TodoModel updatedTask) async {
    var database = await getInstance.getDb();
    int id = await database.update(
      tableName,
      updatedTask.toJson(),
      where: 'id = ?',
      whereArgs: [updatedTask.id],
    );
    debugPrint("TASK UPDATED");
    return updatedTask.copyWith(id: id);
  }

  static Future<List<TodoModel>> getAllTasks() async {
    var database = await getInstance.getDb();
    var orderBy = "${TodoFields.createdAt} DESC";
    var listOfTodos = await database.query(
      tableName,
      orderBy: orderBy,
    );

    var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();

    return list;
  }

  static Future<List<TodoModel>> getTaskByCategoryId(int categoryId) async {
    var database = await getInstance.getDb();
    List<Map> result = await database.rawQuery(
      'SELECT * FROM $tableName WHERE ${TodoFields.categoryId}=?',
      [categoryId],
    );

    var list = result
        .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }

  static Future<List<TodoModel>> getTaskByTitle({String title = ''}) async {
    var database = await getInstance.getDb();

    if (title.isNotEmpty) {
      var listOfTodos = await database.query(
        tableName,
        where: 'title LIKE ?',
        whereArgs: ['%$title%'],
      );
      var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();
      return list;
    } else {
      var listOfTodos = await database.query(
        tableName,
        columns: [
          TodoFields.id,
          TodoFields.title,
          TodoFields.description,
          TodoFields.date,
          TodoFields.categoryId,
          TodoFields.isCompleted,
          TodoFields.createdAt,
        ],
      );

      var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();
      return list;
    }
  }

  // static Future<List<TodoModel>> getTodosIsCompleted(int isCompleted,
  //     {String title = ''}) async {
  //   var database = await getInstance.getDb();

  //   if (title.isNotEmpty) {
  //     var listOfTodos = await database.query(
  //       tableName,
  //       where: 'title LIKE ? AND ${TodoFields.isCompleted} = ?',
  //       whereArgs: ['%$title%', '$isCompleted'],
  //     );
  //     var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();
  //     return list;
  //   } else {
  //     var listOfTodos = await database.query(tableName,
  //         columns: [
  //           TodoFields.id,
  //           TodoFields.title,
  //           TodoFields.description,
  //           TodoFields.date,
  //           TodoFields.priority,
  //           TodoFields.categoryId,
  //           TodoFields.isCompleted
  //         ],
  //         where: '${TodoFields.isCompleted} = ?',
  //         whereArgs: ['$isCompleted']);

  //     var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();
  //     return list;
  //   }
  // }

  static Future<int> deleteTaskById(int id) async {
    var database = await getInstance.getDb();
    debugPrint("TASK DELETED");
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
