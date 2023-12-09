import 'package:flutter/material.dart';
import 'package:movie_booking/Views/login_screen/login_screen.dart';

class HandleRegister extends StatefulWidget {
  const HandleRegister({Key? key}) : super(key: key);

  @override
  HandleRegisterState createState() => HandleRegisterState();

  static void validateRegistration(
    BuildContext context,
    String username,
    String password,
    String firstname,
    String lastname,
    String phone,
    String address,
    String repassword,
  ) {
    HandleRegisterState().validateRegistration(
      context,
      username,
      password,
      repassword,
      firstname,
      lastname,
      phone,
      address,
    );
  }
}

class HandleRegisterState extends State<HandleRegister> {
  void validateRegistration(
    BuildContext context,
    String username,
    String password,
    String firstname,
    String lastname,
    String phone,
    String address,
    String repassword,
  ) {
    RegExp emailRegex =
        RegExp(r'^(?=.{8,50}$)[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

    // Password regex pattern
    RegExp passwordRegex = RegExp(r'^.{6,50}$');

    // Check if email is valid
    if (!emailRegex.hasMatch(username)) {
      _showSnackBar(context, "Invalid email");
      return;
    }
    // Check if password is valid
    if (!passwordRegex.hasMatch(password)) {
      _showSnackBar(context, "Invalid password");
      return;
    }

    // Check if passwords match
    if (repassword != password) {
      _showSnackBar(context, "Passwords do not match");
      return;
    }
    // Check if name is valid (between 6 and 30 characters)
    RegExp nameRegex = RegExp(r'^.{6,30}$');
    if (!nameRegex.hasMatch(firstname)) {
      _showSnackBar(context, "Invalid frist name");
      return;
    }
    if (!nameRegex.hasMatch(lastname)) {
      _showSnackBar(context, "Invalid last name");
      return;
    }
    // Check if phone is invalid (doesn't match the pattern)
    RegExp phoneRegex = RegExp(r'^0\d{10}$');
    if (phoneRegex.hasMatch(phone)) {
      _showSnackBar(context, "Invalid phone number");
      return;
    }
    // Check if address is valid (between 6 and 30 characters)
    RegExp addressRegex = RegExp(r'^.{6,30}$');
    if (!addressRegex.hasMatch(address)) {
      _showSnackBar(context, "Invalid address");
      return;
    }
    // Successful registration
    onRegistrationSuccess(context);
    _showSnackBar(context, "Registration successful");
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
