import 'package:sqflite/sqflite.dart';  // <-- importante
import '../database/user_dao.dart';
import '../models/user.dart';

class UserRepository {
  final _dao = UserDAO();

  Future<User?> login(String email, String password) {
    return _dao.login(email, password);
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      await _dao.insert(
        User(
          name: name,
          email: email,
          password: password,
        ),
      );
      return true;
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return false;
      } else {
        print('Erro no banco ao registrar usuário: $e');
        rethrow;
      }
    }
  }
}
