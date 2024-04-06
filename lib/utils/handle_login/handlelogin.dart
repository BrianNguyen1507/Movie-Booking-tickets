import 'package:flutter/material.dart';
import 'package:movie_booking/model/users/Account.dart';
import 'package:movie_booking/model/users/User.dart';
import 'package:movie_booking/services/authenticate.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HandleLogin {
  Future<bool?> handleLogin(
      BuildContext context, String username, String password) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        _showToast('Invalid username or password');
        return false;
      }
      if (!validateInput(username, password)) {
        _showToast('Invalid username or password');
        return false;
      }

      final user = User(
        id: '',
        name: '',
        level: '',
        phoneNumber: '',
        address: '',
        account: Account(
          username: username,
          password: password,
        ),
      );

      final token = await AuthenticationService.authenticate(user);

      if (token != null) {
        _showToast('Login successful!');

        Navigator.pop(context, true);
        return true;
      } else {
        _showToast('Invalid username or password');
      }
    } catch (error) {
      _showToast('Error logging in');
    }
    return false;
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

  bool validateInput(String username, String password) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_-]{6,20}$');
    bool isUsernameValid = usernameRegex.hasMatch(username);
    RegExp passwordRegex = RegExp(r'^.{4,50}$');
    bool isPasswordValid = passwordRegex.hasMatch(password);
    return isUsernameValid && isPasswordValid;
  }
}
