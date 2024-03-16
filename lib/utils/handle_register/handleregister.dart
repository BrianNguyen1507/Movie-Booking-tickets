import 'package:flutter/material.dart';
import 'package:movie_booking/services/signup.dart';
import 'package:movie_booking/Views/login_screen/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    if (!isValidEmail(username)) {
      _showToast( "Invalid user name");
      return;
    }
    if (!isValidPassword(password)) {
      _showToast("Invalid password");
      return;
    }
    if (repassword.trim() != password.trim()) {
      _showToast( "Passwords do not match");
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
      onRegistrationSuccess(context);
      _showToast( "Registration successful");
    } else {
      _showToast( "User already exists or registration failed");
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

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
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
