import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_booking/Views/login_screen/login_screen.dart';

class HandleRegister extends StatefulWidget {
  const HandleRegister({Key? key}) : super(key: key);

  @override
  HandleRegisterState createState() => HandleRegisterState();

  static void validateRegistration(
    BuildContext context,
    String username,
    String password,
    String repassword,
    String firstname,
    String lastname,
    String address,
    String phone,
  ) {
    HandleRegisterState().validateRegistration(
      context,
      username.trim(),
      password.trim(),
      repassword.trim(),
      firstname.trim(),
      lastname.trim(),
      address,
      phone.trim(),
    );
  }
}

class HandleRegisterState extends State<HandleRegister> {
  void validateRegistration(
    BuildContext context,
    String username,
    String password,
    String repassword,
    String firstname,
    String lastname,
    String address,
    String phone,
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

    // Validate other fields if needed...

    // API call for user registration
    final registrationSuccess = await registerUser(
      username,
      password,
      firstname,
      lastname,
      address,
      phone,
    );

    if (registrationSuccess) {
      // Successful registration
      onRegistrationSuccess(context);
      _showSnackBar(context, "Registration successful");
    } else {
      // Registration failed
      _showSnackBar(context, "Registration failed");
    }
  }

  Future<bool> registerUser(
    String username,
    String password,
    String firstname,
    String lastname,
    String address,
    String phone,
  ) async {
    try {
      const apiUrl =
          'https://api.example.com/register'; // Replace with your API URL
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': username,
          'password': password,
          'firstname': firstname,
          'lastname': lastname,
          'address': address,
          'phone': phone,
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
