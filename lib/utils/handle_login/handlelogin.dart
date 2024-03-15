import 'package:flutter/material.dart';
import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/model/users/Account.dart';
import 'package:movie_booking/model/users/User.dart';
import 'package:movie_booking/services/authenticate.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HandleLogin extends StatefulWidget {
  const HandleLogin({Key? key}) : super(key: key);

  @override
  _HandleLoginState createState() => _HandleLoginState();

  Future<void> handleLogin(
      BuildContext context, String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      _showToastInvalid();
      return;
    }
    if (!validateInput(username, password)) {
      _showToastInvalid();
      return;
    }

    final user = User(
      name: '',
      level: '',
      phoneNumber: '',
      address: '',
      account: Account(
        username: username,
        password: password,
      ),
    );

    final isAuthenticated = await AuthenticationService.authenticate(user);

    if (isAuthenticated) {
      _showToastSuccess();
      _onLoginSuccess(context);
    } else {
      _showToastFail();
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showToastSuccess() {
    _showToast('Login successful!');
  }

  void _showToastFail() {
    _showToast('Not found');
  }

  void _showToastInvalid() {
    _showToast('Invalid user name or password');
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
