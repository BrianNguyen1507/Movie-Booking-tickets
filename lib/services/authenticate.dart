import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_booking/model/users/User.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_booking/services/ipconfig.dart';

const storage = FlutterSecureStorage();

class AuthenticationService {
  static Future<Map<String, dynamic>> authenticate(User user) async {
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
            final dynamic id = responseData['id'];

            final bool isAuthenticated = id != null;
            if (isAuthenticated) {
              // Return the authentication result along with the user ID
              return {'authenticated': true, 'userId': id};
            } else {
              return {'authenticated': false, 'userId': null};
            }
          } catch (e) {
            print('Error decoding JSON response: $e');
            return {'authenticated': false, 'userId': null};
          }
        } else {
          print('Empty or null response body');
          return {'authenticated': false, 'userId': null};
        }
      } else {
        print('HTTP Error: ${response.statusCode}');
        return {'authenticated': false, 'userId': null};
      }
    } catch (error) {
      print('Error in authentication request: $error');
      return {'authenticated': false, 'userId': null};
    }
  }
}
