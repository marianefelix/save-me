import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  static const _storage = FlutterSecureStorage();

  static const _tokenKey = 'token';

  static Future<void> setToken(String token) async {
    _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    final response = await _storage.read(key: _tokenKey);

    return response;
  }
}