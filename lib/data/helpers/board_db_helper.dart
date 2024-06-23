// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class BoardDbHelper {
  static const String tableName = "board";
  static const String id = "id";
  static const String name = "name";
  static const String description = "description";
  static const String columns = "columns";

  /// Provides access to the SQLite database.
  ///
  /// This method asynchronously opens or creates a SQLite database with the given [tableName].
  /// If the database does not exist, it creates a new one and defines the table structure based
  /// on the provided SQL query. The method returns a Future that resolves to the opened database.
  ///
  /// Returns:
  ///   A Future that resolves to a [sql.Database] object representing the opened database.
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, '$tableName.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName($id TEXT PRIMARY KEY, $name TEXT, $description TEXT, $columns TEXT)',
        );
      },
      version: 1,
    );
  }

  /// Inserts data into the database.
  ///
  /// This method asynchronously inserts the provided [data] into the database table defined by [tableName].
  /// If a conflict occurs, the existing data is replaced with the new data. It returns void once the operation completes.
  ///
  /// Parameters:
  ///   data - A map containing the data to be inserted.
  static Future<void> insert(Map<String, String> data) async {
    final db = await database();
    await db.insert(
      tableName,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  /// Retrieves all data from the database table.
  ///
  /// This method asynchronously retrieves all data from the database table defined by [tableName].
  /// It returns a list of maps representing the rows in the table.
  ///
  /// Returns:
  ///   A Future that resolves to a list of maps representing the rows in the database table.
  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await database();
    return db.query(tableName);
  }

  /// Updates data in the database table.
  ///
  /// This method asynchronously updates the data in the database table defined by [tableName].
  /// It updates the row with the provided [bid] with the new values specified in [value].
  /// If a conflict occurs, the existing data is replaced with the new data. It returns the number
  /// of rows affected by the update operation.
  ///
  /// Parameters:
  ///   bid - The primary key of the row to update.
  ///   value - A map containing the new values to update.
  ///
  /// Returns:
  ///   A Future that resolves to an integer representing the number of rows affected by the update operation.
  static Future<int> updateData(int bid, Map<String, dynamic> value) async {
    final db = await database();
    return await db.update(
      tableName,
      value,
      where: '$id = ?',
      whereArgs: [bid],
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  /// Deletes data from the database table.
  ///
  /// This method asynchronously deletes the row with the provided [bid] from the database table
  /// defined by [tableName]. It returns void once the operation completes.
  ///
  /// Parameters:
  ///   bid - The primary key of the row to delete.
  static Future<void> delete(int bid) async {
    final db = await database();
    await db.delete(tableName, where: '$id = ?', whereArgs: [bid]);
  }
}
