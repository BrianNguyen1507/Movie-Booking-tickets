import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:movie_booking/Views/splash_screen/Splash_success.dart';

import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/model/methodPayment/method.dart';
import 'package:movie_booking/model/theater/theater.dart';
import 'package:movie_booking/services/Payments/Client/clientId.dart';

class ConfirmPayment extends StatefulWidget {
  final Film movie;
  final Theater theater;
  final List<String> seats;
  final double total;

  const ConfirmPayment({
    Key? key,
    required this.movie,
    required this.seats,
    required this.theater,
    required this.total,
  }) : super(key: key);

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  int _selectedIndex = -1;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Payment Method',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      PaymentMethodCard(
                        icon: Icons.paypal,
                        label: 'PayPal',
                        isSelected: _selectedIndex == 0,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                      ),
                      PaymentMethodCard(
                        icon: Icons.account_balance_wallet,
                        label: 'None',
                        isSelected: _selectedIndex == 1,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                      ),
                      PaymentMethodCard(
                        icon: Icons.account_balance_wallet,
                        label: 'None',
                        isSelected: _selectedIndex == 2,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10.0,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      elevation: 15.0,
                    ),
                    onPressed: () {
                      if (_selectedIndex != -1) {
                        if (_selectedIndex == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => PaypalCheckout(
                                  sandboxMode: true,
                                  clientId: clientid,
                                  secretKey: secretKey,
                                  returnURL: "success.sample.com",
                                  cancelURL:
                                      "https://dh52005810.000webhostapp.com/cancel.html",
                                  transactions: [
                                    {
                                      "amount": {
                                        "total": '${widget.total}',
                                        "currency": "USD",
                                        "details": {
                                          "subtotal": '${widget.total}',
                                        }
                                      },
                                      "description":
                                          "Theater: ${widget.theater.number} - Date: ${widget.theater.date}  - Time: ${widget.theater.time} - Seats position: ${widget.seats}",
                                      "item_list": {
                                        "items": [
                                          {
                                            "name": widget.movie.title,
                                            "quantity": widget.seats.length,
                                            "price": '${widget.movie.price}',
                                            "currency": "USD"
                                          },
                                        ],
                                      }
                                    }
                                  ],
                                  note: 'THANK YOU FOR YOUR PAYMENT',
                                  onSuccess: (Map params) async {
                                    print('Success params: $params');
                                    bool success = params['error'] == false &&
                                        params['message'] == 'Success';
                                    if (success) {
                                      successPayment();
                                    }
                                  },
                                  onError: (error) {
                                    print("onError: $error");
                                  },
                                  onCancel: (params) {
                                    print('cancelled: $params');
                                  }),
                            ),
                          );
                        } else if (_selectedIndex == 1) {
                          return;
                        } else {
                          return;
                        }
                      } else {}
                    },
                    child: const Text(
                      'FINISH PAYMENT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void successPayment() {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const PaymentSuccessScreen(),
      ),
      ModalRoute.withName('/'),
    );
  }
}
