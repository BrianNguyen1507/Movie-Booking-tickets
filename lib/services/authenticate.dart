import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_booking/model/users/User.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_booking/services/ipconfig.dart';

const storage = FlutterSecureStorage();

class AuthenticationService {
  static Future<bool> authenticate(User user) async {
    try {
      const loginApi = "http://$ip:8083/cinema/login";
      final response = await http.post(
        Uri.parse(loginApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "user_name": user.account.username,
          "password": user.account.password,
        }),
      );

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);
        final dynamic id = responseData['id'];
        final dynamic token = responseData['token'];
        print('token: ${responseData['token']}');
        final bool isAuthenticated = id != null;
        if (isAuthenticated) {
          await storage.write(key: 'authToken', value: token);

          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
