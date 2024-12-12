import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

Future<Database> initDatabase() async {
  final dbPath = await getDatabasesPath();
  return openDatabase(
    join(dbPath, 'my_database.db'),
    onCreate: (db, version) {
      return db.execute('''
          CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          quantity INTEGER)''');
    },
  );
}

Future<void> insertData(Database db, Map<String, dynamic> item) async {
  await db.insert('items', item, conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Map<String, dynamic>>> fetchItems(Database db) async {
  return await db.query('table');
}

Future<void> updateItems(Database db, int id, Map<String, dynamic> updates) async {
  await db.update('table', updates, where: 'id = ?', whereArgs: [id]);
}

Future<void> deleteItems(Database db, int id) async {
  await db.delete('table', where: 'id = ?', whereArgs: [id]);
}
