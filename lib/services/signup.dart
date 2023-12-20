import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpService {
  static Future<bool> registration(
    String name,
    String phoneNumber,
    String level,
    String gender,
    String address,
    String username,
    String password,
  ) async {
    try {
      const apiUrl = "http://192.168.2.100:8083/cinema/register";
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "name": name,
          "phoneNumber": phoneNumber,
          "level": level,
          "gender": gender,
          "address": address,
          "account": {"user_name": username, "password": password}
        }),
      );

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);
        print('JSON Response: $responseData');
        final dynamic existUser = responseData['user_name'];
        final bool isExisted = existUser == null;

        if (isExisted) {
          print('Registration successful for user: $username');
          return true;
        } else {
          print('Registration failed for user: $username');
          return false;
        }
      } else {
        print('Registration Error: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Exception: $error');
      return false;
    }
  }
}
