import 'package:sqflite/sqflite.dart';
import '../database/database_provider.dart';
import '../models/ong.dart';

class OngRepository {
  Future<int> createOng(Ong ong) async {
    final db = await DatabaseProvider.instance.database;

    return await db.insert(
      'ong',
      ong.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Ong?> getOngById(int id) async {
    final db = await DatabaseProvider.instance.database;

    final result = await db.query(
      'ong',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return Ong.fromMap(result.first);
    }

    return null;
  }

  Future<Ong?> login(String email, String password) async {
    final db = await DatabaseProvider.instance.database;

    final result = await db.query(
      'ong',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return Ong.fromMap(result.first);
    }

    return null;
  }

  Future<List<Ong>> getAll() async {
    final db = await DatabaseProvider.instance.database;

    final result = await db.query('ong');

    return result.map((m) => Ong.fromMap(m)).toList();
  }
}
