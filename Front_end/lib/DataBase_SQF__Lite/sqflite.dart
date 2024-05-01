// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqflite {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initial();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initial() async {
    String DataBasePath = await getDatabasesPath();
    String path = join(DataBasePath, 'Nour.db');
    Database Mydb = await openDatabase(path,
        onCreate: _onCreate, version: 4, onUpgrade: _onUpgrade);
    return Mydb;
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('ALTER TABLE notes ADD COLUMN color TEXT');
    print('onUpgrade =================================');
  }

  Future _onCreate(Database db, int version) async {
    // batch created for create more than one table .
    Batch batch = db.batch();

    batch.execute('''
      CREATE TABLE "notes" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "Title" TEXT NOT NULL,
        "note" TEXT NOT NULL
        )
      ''');
    print('onCreate =================================');
  }

  Future<List<Map<String, Object?>>> fetshData(String sql) async {
    Database? Mydb = await db;
    Future<List<Map<String, Object?>>> response = Mydb!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? Mydb = await db;
    Future<int> response = Mydb!.rawInsert(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? Mydb = await db;
    Future<int> response = Mydb!.rawDelete(sql);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? Mydb = await db;
    Future<int> response = Mydb!.rawUpdate(sql);
    return response;
  }

  DeleteDataBase() async {
    String DataBasePath = await getDatabasesPath();
    String path = join(DataBasePath, 'Nour.db');
    await deleteDatabase(path);
  }


  //**----------------------------------------------------------------**//
  Future<List<Map<String, Object?>>> fetsh(String table) async {
    Database? Mydb = await db;
    Future<List<Map<String, Object?>>> response = Mydb!.query(table);
    return response;
  }

  Future<int> insert(String table, Map<String, Object> values) async {
    Database? Mydb = await db;
    Future<int> response = Mydb!.insert(table, values);
    return response;
  }

  Future<int> delete(String table, String myWhere) async {
    Database? Mydb = await db;
    Future<int> response = Mydb!.delete(table, where: myWhere);
    return response;
  }

  Future<int> update(
      String table, String myWhere, Map<String, Object> values) async {
    Database? Mydb = await db;
    Future<int> response = Mydb!.update(table, values, where: myWhere);
    return response;
  }
}
