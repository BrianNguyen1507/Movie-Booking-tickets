import 'package:flutter/material.dart';
import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/model/users/Account.dart';
import 'package:movie_booking/model/users/User.dart';
import 'package:movie_booking/services/authenticate.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool isLogin = false;

class HandleLogin extends StatefulWidget {
  const HandleLogin({Key? key}) : super(key: key);

  static late User loggedInUser = User(
    id: '',
    name: '',
    level: '',
    phoneNumber: '',
    address: '',
    account: Account(username: '', password: ''),
  );

  static late dynamic userId = '';

  @override
  _HandleLoginState createState() => _HandleLoginState();

  static bool getIsLogin() {
    return isLogin;
  }

  static User getLoggedInUser() {
    return loggedInUser;
  }

  static dynamic getIdUser() {
    return userId;
  }

  Future<bool?> handleLogin(
      BuildContext context, String username, String password) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        _showToastInvalid();
        return false;
      }
      if (!validateInput(username, password)) {
        _showToastInvalid();
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

      final Map<String, dynamic> response =
          await AuthenticationService.authenticate(user);

      final bool isAuthenticated = response['authenticated'];

      if (isAuthenticated) {
        isLogin = true;
        loggedInUser = user;
        userId = response['userId'];
        _showToastSuccess();
        _onLoginSuccess(context);
        // Print userId after it's set
        print('User ID: $userId');
        // Retrieve userId using getIdUser() method
        print('Retrieved User ID: ${HandleLogin.getIdUser()}');
        return isLogin;
      } else {
        _showToastFail();
        return isLogin;
      }
    } catch (error) {
      print('Error during login: $error');
      return false;
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
