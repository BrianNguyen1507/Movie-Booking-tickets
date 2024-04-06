import 'package:flutter/material.dart';

class ConfirmDialogPopUp extends StatelessWidget {
  final VoidCallback onLogoutConfirmed;

  const ConfirmDialogPopUp({Key? key, required this.onLogoutConfirmed})
      : super(key: key);

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
                onLogoutConfirmed();
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
