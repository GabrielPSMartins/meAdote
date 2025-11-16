import 'package:sqflite/sqflite.dart';
import '../models/user.dart';
import 'database_provider.dart';

class UserDAO {
  Future<int> insert(User user) async {
    final db = await DatabaseProvider.instance.database;

    return await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort, 
    );
  }

  Future<User?> login(String email, String password) async {
    final db = await DatabaseProvider.instance.database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }
}
