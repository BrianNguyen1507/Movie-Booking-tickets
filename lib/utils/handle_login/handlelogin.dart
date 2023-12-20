import 'package:flutter/material.dart';
import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/services/authenticate.dart';

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
    if (!validateInput(username, password)) {
      _showSnackBarInvalid(context);
      return;
    }

    final isAuthenticated = await AuthenticationService.authenticate(
      username,
      password,
    );

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
          child: Text('Invalid user name or password'),
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

  bool validateInput(String username, String password) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_-]{6,20}$');
    bool isUsernameValid = usernameRegex.hasMatch(username);
    RegExp passwordRegex = RegExp(r'^.{4,50}$');
    bool isPasswordValid = passwordRegex.hasMatch(password);
    return isUsernameValid && isPasswordValid;
  }
}

class _HandleLoginState extends State<HandleLogin> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
