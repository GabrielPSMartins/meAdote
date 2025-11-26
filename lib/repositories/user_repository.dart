import 'package:sqflite/sqflite.dart';
import '../database/database_provider.dart';
import '../models/user.dart';

class UserRepository {
  Future<bool> register(String name, String email, String password) async {
    final db = await DatabaseProvider.instance.database;

    try {
      await db.insert(
        "users",
        {
          "name": name,
          "email": email,
          "password": password,
        },
        conflictAlgorithm: ConflictAlgorithm.fail,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> login(String email, String password) async {
    final db = await DatabaseProvider.instance.database;

    final result = await db.query(
      "users",
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );

    if (result.isEmpty) return null;

    return User.fromMap(result.first);
  }

  Future<User?> getByEmail(String email) async {
    final db = await DatabaseProvider.instance.database;

    final result = await db.query(
      "users",
      where: "email = ?",
      whereArgs: [email],
      limit: 1,
    );

    if (result.isEmpty) return null;

    return User.fromMap(result.first);
  }
}
