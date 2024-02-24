import 'dart:collection';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Model/Student_Model.dart';

class DB_helper
{
  static final _databaseName = 'student.db';
  static final _student_table = 'student_table';
  static final _databaseVersion = 1;
  static Database? _database;

  Future<Database> get database async
  {
    if(_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_student_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name STRING, 
        age INTEGER, 
        class INTEGER
        )
        ''');
  }

  Future<int?> insert_student(HashMap student) async
  {
    print(student);
    Database? db = await DB_helper._database;
    return await db!.insert(_student_table, {
      'name' : student['name'],
      'age' : student['age'],
      'class' : student['class']
    });
  }

  Future<List<Map<String, dynamic>>> queryallRows() async
  {
    Database? db = DB_helper._database;
    return await db!.query(_student_table);
  }

  Future<int> delete(String id) async
  {
    Database? db = await DB_helper._database;
    return await db!.delete(_student_table,where: "id = ?", whereArgs: [id]);
  }

  Future<int> update(String id, HashMap studentmap) async
  {
    Database? db = await DB_helper._database;
    return await db!.update(_student_table, {
      'name' : studentmap['name'],
      'age' : studentmap['age'],
      'class' : studentmap['class']
    }, where: "id = ?", whereArgs: [id] );
  }

  Future<List<Map<String, dynamic>>> edit(String id) async
  {
    Database? db = await DB_helper._database;
    return await db!.query(_student_table,where: "id = ?",whereArgs: [id]);
  }


}