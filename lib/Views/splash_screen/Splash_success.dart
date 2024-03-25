import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_booking/Views/index/index.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const IndexPage(
            title: '',
            initialIndex: 0,
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Success'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Payment Successful!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
