import 'package:flutter/material.dart';
import 'package:movie_booking/Views/index/index.dart';

class ShowAlert {
  static bool _isAlertShown = false;

  static get userPreferences => null;

  static void showAlertDialog(BuildContext context) {
    if (!_isAlertShown) {
      _isAlertShown = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: const Text('Ticket booking period has ended'),
              content: const Text('Please try again.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    resetAlertStatus();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IndexPage(
                          title: '',
                          initialIndex: 0,
                        ),
                      ),
                      ModalRoute.withName('/'),
                    );
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        },
      );

      Future.delayed(const Duration(seconds: 3), () {
        if (_isAlertShown) {
          resetAlertStatus();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const IndexPage(
                title: '',
                initialIndex: 0,
              ),
            ),
            ModalRoute.withName('/'),
          );
        }
      });
    }
  }

  static void resetAlertStatus() {
    _isAlertShown = false;
  }

  static void alertNullselection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No seats were selected'),
          content: const Text('Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
