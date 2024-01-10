import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/todo_model_for_sql/todo_model_sql.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("todos.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${ToDoModelFields.toDoTable} (
    ${ToDoModelFields.id} $idType,
    ${ToDoModelFields.categoryId} $intType,
    ${ToDoModelFields.title} $textType,
    ${ToDoModelFields.description} $textType,
    ${ToDoModelFields.createdAt} $textType,
    ${ToDoModelFields.expiredDate} $textType,
    ${ToDoModelFields.toDoImportance} $intType,
    ${ToDoModelFields.status} $intType
    )
    ''');

    // '''
    //  CREATE TABLE toDoTAble (_id INTEGER PRIMARY KEY AUTOINCREMENT, )
    // '''

    // db.query(
    //   ToDoModelFields.toDoTable,
    //   orderBy: "${ToDoModelFields.title} ASC",
    // );
  }

  static Future<ToDoModelSql> insertTodo(ToDoModelSql toDo) async {
    final db = await getInstance.database;
    final int id = await db.insert(ToDoModelFields.toDoTable, toDo.toJson());
    return toDo.copyWith(id: id);
  }

  static Future<List<ToDoModelSql>> getAllToDos() async {
    List<ToDoModelSql> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(ToDoModelFields.toDoTable))
        .map((e) => ToDoModelSql.fromJson(e))
        .toList();

    return allToDos;
  }

  static updateToDoStatus({required int id, required int statusIndex}) async {
    final db = await getInstance.database;
    db.update(
      ToDoModelFields.toDoTable,
      {ToDoModelFields.status: statusIndex},
      where: "${ToDoModelFields.id} = ?",
      whereArgs: [id],
    );
  }



  static updateToDo({required ToDoModelSql toDoModelSql}) async {
    final db = await getInstance.database;
    db.update(
      ToDoModelFields.toDoTable,
      toDoModelSql.toJson(),
      where: "${ToDoModelFields.id} = ?",
      whereArgs: [toDoModelSql.id],
    );
  }

  static deleteToDo(int id) async {
    final db = await getInstance.database;
    db.delete(
      ToDoModelFields.toDoTable,
      where: "${ToDoModelFields.id} = ?",
      whereArgs: [id],
    );
  }
}
