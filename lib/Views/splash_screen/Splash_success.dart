import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/Views/order_tickets/order_tickets_screen.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  final storage = const FlutterSecureStorage();
  String? username;
  String? userId;

  Future<void> getUserInfo() async {
    username = await storage.read(key: 'username');
    userId = await storage.read(key: 'userId');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => OrderedMovie(user: userId),
        ),
        (routes) => routes.isFirst,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IndexPage(
                        initialIndex: 0,
                        title: 'Home',
                      ),
                    ));
              },
              icon: const Icon(Icons.home))
        ],
        title: const Text('THANK YOU FOR PAYMENT'),
        centerTitle: true,
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
