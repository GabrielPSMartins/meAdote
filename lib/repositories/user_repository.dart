import 'package:sqflite/sqflite.dart';
import '../database/user_dao.dart';
import '../models/user.dart';

class UserRepository {
  final _dao = UserDAO();

  Future<User?> login(String email, String password) {
    return _dao.login(email, password);
  }

  Future<User?> getById(int id) {
    return _dao.getById(id);
  }

  Future<bool> register(User user) async {
    try {
      await _dao.insert(user);
      return true;
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return false;
      }
      rethrow;
    }
  }
}
