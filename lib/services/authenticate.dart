import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_booking/model/users/User.dart';
import 'package:movie_booking/services/AuthToken.dart';
import 'package:movie_booking/services/ipconfig.dart';

const storage = FlutterSecureStorage();

class AuthenticationService {
  static Future<String?> authenticate(User user) async {
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
        if (response.body.isNotEmpty) {
          try {
            final dynamic responseData = json.decode(response.body);
            final dynamic token = responseData['token'];
            final bool isAuthenticated = responseData['authenticated'];

            if (isAuthenticated && token != null) {
              //save token
              await storage.write(
                  key: 'username', value: user.account.username);
              await TokenAuthenticated.saveToken(token);
              return token;
            }
          } catch (e) {
            print('Error decoding JSON response: $e');
          }
        } else {
          print('Empty or null response body');
        }
      } else {
        print('HTTP Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error in authentication request: $error');
    }
    return null;
  }
}
