import 'package:flutter/material.dart';
import 'package:movie_booking/Views/login_screen/login_screen.dart';

class ConfirmDialogPopUp extends StatelessWidget {
  const ConfirmDialogPopUp({Key? key}) : super(key: key);

  void _onLogOutPress(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    (context as Element).markNeedsBuild();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          alignment: Alignment.center,
          elevation: 0,
          title: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _onLogOutPress(context); 
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showLogoutDialog(BuildContext context) async {
    await _showDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
