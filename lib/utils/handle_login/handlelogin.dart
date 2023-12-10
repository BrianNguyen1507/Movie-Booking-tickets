import 'package:flutter/material.dart';
import 'package:movie_booking/Views/index/index.dart';

class HandleLogin extends StatefulWidget {
  const HandleLogin({Key? key}) : super(key: key);

  @override
  HandleLoginState createState() => HandleLoginState();

  void handleLogin(BuildContext context, String username, String password) {
    HandleLoginState()._handleLogin(context, username, password);
  }
}

class HandleLoginState extends State<HandleLogin> {
  final String testEmail = "admin@gmail.com";
  final String testPass = "123123Hh@";
//dummy account .

  bool validateInput(String username, String password) {
    RegExp emailRegex =
        RegExp(r'^(?=.{8,50}$)[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
    RegExp passwordRegex = RegExp(r'^.{6,50}$');
    bool isPasswordValid = passwordRegex.hasMatch(password);
    bool isEmailValid = emailRegex.hasMatch(username);

    return isEmailValid && isPasswordValid;
  }

  void handleLogin(BuildContext context, String username, String password) {
    _handleLogin(context, username, password);
  }

  void _handleLogin(BuildContext context, String username, String password) {
    if (username == "" || password == "") {
      _showSnackBarInvalid(context);
      return;
    }
    if (!validateInput(username, password)) {
      _showSnackBarInvalid(context);
      return;
    }

    if (username == testEmail && password == testPass) {
      // Successful login
      _showSnackBarSuccess(context);
      _onLoginSuccess(context);
    } else {
      // Failed login
      _showSnackBarFail(context);
    }
  }

  void _showSnackBarSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Align(
          alignment: Alignment.bottomCenter,
          child: Text('Login successful!'),
        ),
      ),
    );
  }

  void _showSnackBarFail(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Align(
          alignment: Alignment.bottomCenter,
          child: Text('Not found'),
        ),
      ),
    );
  }

  void _showSnackBarInvalid(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Align(
          alignment: Alignment.bottomCenter,
          child: Text('Invalid email or password'),
        ),
      ),
    );
  }

  void _onLoginSuccess(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const IndexPage(
          title: '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
