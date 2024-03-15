import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_booking/model/users/User.dart';

class AuthenticationService {
  static Future<bool> authenticate(User user) async {
    try {
      const loginApi = "http://192.168.1.3:8083/cinema/login";
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

      try {
        if (response.statusCode == 200) {
          final dynamic responseData = json.decode(response.body);
          final dynamic id = responseData['id'];
          final bool isAuthenticated = id != null;
          if (isAuthenticated) {
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
    } catch (error) {
      return false;
    }
  }
}
