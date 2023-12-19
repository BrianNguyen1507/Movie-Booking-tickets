import 'package:flutter/material.dart';
import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/model/users/User.dart';

class HandleLogin extends StatefulWidget {
  const HandleLogin({Key? key}) : super(key: key);

  @override
  _HandleLoginState createState() => _HandleLoginState();

  Future<void> handleLogin(
      BuildContext context, String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      _showSnackBarInvalid(context);
      return;
    }
    if (!validateInput(password)) {
      _showSnackBarInvalid(context);
      return;
    }

    final myUser = User(
      name: '',
      phoneNumber: '',
      level: '',
      gender: '',
      address: '',
      username: username,
      password: password,
    );

    final isAuthenticated = await myUser.authenticate();
    if (isAuthenticated) {
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

  bool validateInput(String password) {
    // Password regex pattern
    RegExp passwordRegex = RegExp(r'^.{6,50}$');
    return passwordRegex.hasMatch(password);
  }
}

class _HandleLoginState extends State<HandleLogin> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
