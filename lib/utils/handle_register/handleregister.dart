import 'package:flutter/material.dart';
import 'package:movie_booking/services/signup.dart';
import 'package:movie_booking/Views/login_screen/login_screen.dart';

enum Gender { Nam, Nu }

class HandleRegister extends StatefulWidget {
  const HandleRegister({Key? key}) : super(key: key);

  @override
  HandleRegisterState createState() => HandleRegisterState();
}

class HandleRegisterState extends State<HandleRegister> {
  Gender gender = Gender.Nam; // Moved gender to the state
  String level = "none";

  Future<dynamic> validateRegistration(
    BuildContext context,
    String username,
    String password,
    String repassword,
    String name,
    String gender,
    String address,
    String phoneNumber,
  ) async {
    // Validate input
    if (!isValidEmail(username)) {
      _showSnackBar(context, "Invalid user name");
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

    final isAuthenticated = await SignUpService.registration(
      name,
      phoneNumber,
      level,
      gender,
      address,
      username,
      password,
    );

    if (isAuthenticated) {
      // Successful registration
      onRegistrationSuccess(context);
      _showSnackBar(context, "Registration successful");
    } else {
      _showSnackBar(context, "Registration failed");
      // Registration failed
    }
  }

  bool isValidEmail(String username) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_-]{6,20}$');
    return usernameRegex.hasMatch(username);
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
    // Your build implementation goes here
    return Container();
  }
}
