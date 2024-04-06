import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenAuthenticated {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String _tokenKey = 'token';

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  static Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  static Future<void> removeToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

  static Future<bool> isLoggedIn() async {
    final String? token = await _secureStorage.read(key: _tokenKey);
    return token != null && token.isNotEmpty;
  }

  static bool login() {
    bool loggedIn = false;
    isLoggedIn().then((value) => loggedIn = value);
    return loggedIn;
  }
}
