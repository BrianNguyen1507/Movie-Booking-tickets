import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String name;
  final String phoneNumber;
  final String level;
  final String gender;
  final String address;
  final Map<String, String> account;

  User({
    required this.name,
    required this.phoneNumber,
    required this.level,
    required this.gender,
    required this.address,
    required String username,
    required String password,
  }) : account = {'username': username, 'password': password};

  // Check login.
  Future<bool> authenticate() async {
    try {
      const apiUrl = 'https://randomuser.me/api/';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final userInfo = responseData['results'][0];

        final apiUsername = userInfo['login']['username'];
        final apiPassword = userInfo['login']['password'];
        print(apiUsername +","+  apiPassword);

        return apiUsername == account['username'] &&
            apiPassword == account['password'];
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
