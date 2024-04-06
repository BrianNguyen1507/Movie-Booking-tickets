import 'package:flutter/material.dart';
import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/services/Storage/storageData.dart';

UserPreferences userPreferences = UserPreferences();

class ShowAlert {
  static void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seat selection time is over'),
          content: const Text('Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                userPreferences.removeData(); //remove selection data
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IndexPage(
                      title: '',
                      initialIndex: 0,
                    ),
                  ),
                );
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IndexPage(
            title: '',
            initialIndex: 0,
          ),
        ),
      );
    });
  }
}
