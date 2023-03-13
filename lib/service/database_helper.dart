
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/delivery_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Deliveries.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Delivery(bILLNO INTEGER PRIMARY KEY, cSTMRADDRSS TEXT NOT NULL, CSTMR_NM TEXT NOT NULL);"),
        version: _version);
  }

  static Future<int> addNote(DeliveryBills delivery) async {
    final db = await _getDB();
    return await db.insert("Delivery", delivery.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateNote(DeliveryBills delivery) async {
    final db = await _getDB();
    return await db.update("Delivery", delivery.toJson(),
        where: 'bILLNO = ?',
        whereArgs: [delivery.bILLNO],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteNote(DeliveryBills delivery) async {
    final db = await _getDB();
    return await db.delete(
      "Delivery",
      where: 'bILLNO = ?',
      whereArgs: [delivery.bILLNO],
    );
  }

  static Future<List<DeliveryBills>?> getAllNotes() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Delivery");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => DeliveryBills.fromJson(maps[index]));
  }
}