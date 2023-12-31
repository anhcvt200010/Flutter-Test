import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper{

  static Future<void> createTables(sql.Database database) async{
    await database.execute('''
        CREATE TABLE data (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          name TEXT,
          addr TEXT,
          classes INTEGER,
          gpa REAL
        )
      ''');
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase(
      "database_name.db",
      version: 1,
      onCreate: (sql.Database database, int version) async{
        await createTables(database);
      }
    );
  }

  static Future<int> createData(String name, String addr, String classes, double gpa) async{
    final db = await SQLHelper.db();

    final values = {'name': name, 'addr': addr, 'classes': classes, 'gpa': gpa};
    final id = await db.insert('data', values, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async{
    final db = await SQLHelper.db();
    return db.query('data', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSingleData(int id) async{
    final db = await SQLHelper.db();
    return db.query('data', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateData(int id, String name, String addr, String classes, double gpa) async{
    final db = await SQLHelper.db();

    final current_data = await SQLHelper.getSingleData(id);
    final Map<String, dynamic> rowData = current_data.first;
    if (name == "")
      name = rowData["name"];
    if (addr == "")
      addr = rowData["addr"];
    if (classes == "")
      classes = rowData["classes"];

    final data = {
      'name': name,
      'addr': addr,
      'classes': classes,
      'gpa': gpa
    };
    final result = await db.update('data', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id) async{
    final db = await SQLHelper.db();
    try{
      await db.delete('data', where: "id = ?", whereArgs: [id]);
    }catch(e){
    }
  }
}