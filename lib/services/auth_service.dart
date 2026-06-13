import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  static const _keyUserId = 'userId';
  static const _keyName = 'nome';
  static const _keyEmail = 'email';
  static const _keyRole = 'role';
  static const _keyCity = 'cidade';
  static const _keyState = 'estado';

  static Future<void> saveSession(User user) async {
    final prefs = await SharedPreferences.getInstance();
    if (user.id != null) await prefs.setInt(_keyUserId, user.id!);
    await prefs.setString(_keyName, user.name);
    await prefs.setString(_keyEmail, user.email);
    await prefs.setString(_keyRole, user.role);
    if (user.city != null) await prefs.setString(_keyCity, user.city!);
    if (user.state != null) await prefs.setString(_keyState, user.state!);
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRole);
  }

  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyUserId);
  }

  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName) ?? 'Usuário';
  }

  static Future<String> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail) ?? '';
  }

  static Future<String?> getCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyCity);
  }

  static Future<String?> getState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyState);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserId);
    await prefs.remove(_keyName);
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyRole);
    await prefs.remove(_keyCity);
    await prefs.remove(_keyState);
    await prefs.remove('senha');
  }
}
