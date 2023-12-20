import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationService {
  static Future<bool> authenticate(String username, String password) async {
    try {
      const apiUrl = "http://192.168.2.100:8083/cinema/login";
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "user_name": username,
          "password": password,
        }),
      );

      try {
        if (response.statusCode == 200) {
          final dynamic responseData = json.decode(response.body);
          print('JSON Response: $responseData');
          final String username = responseData['user_name'];
          final String userPassword = responseData['password'];
          final dynamic id = responseData['id'];
          final bool isAuthenticated = id != null;
          if (isAuthenticated) {
            print('Authentication successful for user: $username');
            return true;
          } else {
            print('Authentication failed for user: $username');
            return false;
          }
        } else {
          print('Authentication Error: ${response.statusCode}');
          return false;
        }
      } catch (error) {
        print('Exception: $error');
        return false;
      }
    } catch (error) {
      print('Exception: $error');
      return false;
    }
  }
}
