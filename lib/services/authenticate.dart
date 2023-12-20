import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationService {
  static Future<bool> authenticate(String username, String password) async {
    try {
      const apiUrl = 'https://your-authentication-api.com/authenticate';
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'user_name': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final bool isAuthenticated = responseData['authenticated'];
        return isAuthenticated;
      } else {
        // Handle authentication errors
        print('Authentication Error: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
      return false;
    }
  }
}
