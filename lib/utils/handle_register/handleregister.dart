import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_booking/Views/login_screen/login_screen.dart';
import 'package:movie_booking/model/users/User.dart';

class HandleRegister extends StatefulWidget {
  const HandleRegister({Key? key}) : super(key: key);

  @override
  HandleRegisterState createState() => HandleRegisterState();

  static void validateRegistration(
    BuildContext context,
    String username,
    String password,
    String repassword,
    String name,
    String address,
    String phoneNumber,
  ) {
    HandleRegisterState().validateRegistration(
      context,
      username.trim(),
      password.trim(),
      repassword.trim(),
      name.trim(),
      address.trim(),
      phoneNumber.trim(),
    );
  }
}

class HandleRegisterState extends State<HandleRegister> {
  void validateRegistration(
    BuildContext context,
    String username,
    String password,
    String repassword,
    String name,
    String address,
    String phoneNumber,
  ) async {
    // Validate input
    if (!isValidEmail(username)) {
      _showSnackBar(context, "Invalid email");
      return;
    }

    if (!isValidPassword(password)) {
      _showSnackBar(context, "Invalid password");
      return;
    }

    // Check if passwords match
    if (repassword.trim() != password.trim()) {
      _showSnackBar(context, "Passwords do not match");
      return;
    }

    // Create a User instance with registration data
    User user = User(
      name: name,
      phoneNumber: phoneNumber,
      level: 'Dong', // You can set an initial level or leave it empty
      gender: 'Nam', // You can set an initial gender or leave it empty
      address: address,
      account: {
        'user_name': username,
        'password': password,
      },
    );

    // API call for user registration
    final registrationSuccess = await registerUser(user);

    if (registrationSuccess) {
      // Successful registration
      // ignore: use_build_context_synchronously
      onRegistrationSuccess(context);
      // ignore: use_build_context_synchronously
      _showSnackBar(context, "Registration successful");
    } else {
      // Registration failed
      // ignore: use_build_context_synchronously
      _showSnackBar(context, "Registration failed");
    }
  }

  Future<bool> registerUser(User user) async {
    try {
      const apiUrl = 'https://api.example.com/register'; //API post to regis
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'user_name': user.account['user_name'],
          'password': user.account['password'],
          'name': user.name,
          'phoneNumber': user.phoneNumber,
          'address': user.address,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // Check the registration response data
        return responseData['success'] == true;
      } else {
        // Handle registration errors
        print('Registration Error: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
      return false;
    }
  }

  bool isValidEmail(String email) {
    RegExp emailRegex =
        RegExp(r'^(?=.{8,50}$)[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    RegExp passwordRegex = RegExp(r'^.{6,50}$');
    return passwordRegex.hasMatch(password);
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Align(
          alignment: Alignment.topCenter,
          child: Text(message),
        ),
      ),
    );
  }

  void onRegistrationSuccess(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
