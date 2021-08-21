import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _keyUsername = 'username';
  static const _keypassword = 'userpassword';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _preferences!.setString(_keyUsername, username);
  static Future setPassword(String userpassword) async =>
      await _preferences!.setString(_keypassword, userpassword);

  static String? getUsername() => _preferences!.getString(_keyUsername);

  static String? getUserpassword() => _preferences!.getString(_keypassword);

  getValue() {}
}
