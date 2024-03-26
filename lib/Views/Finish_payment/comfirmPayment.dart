import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:movie_booking/Views/splash_screen/Splash_success.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/model/methodPayment/method.dart';
import 'package:movie_booking/model/theater/theater.dart';
import 'package:movie_booking/services/Payments/Client/clientId.dart';
import 'package:movie_booking/services/Payments/Payment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum PaymentMethod { paypal, none }

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
  late String method;
  final storage = const FlutterSecureStorage();
  String? username;
  String? userId;
  PaymentMethod _selectedMethod = PaymentMethod.paypal;
  List<String> convertedPositions = [];
  @override
  void initState() {
    super.initState();
    getUserInfo();
    convertedPositions = convertSeatPositions(widget.seats);
  }

  Future<void> getUserInfo() async {
    username = await storage.read(key: 'username');
    userId = await storage.read(key: 'userId');
    setState(() {}); // Update the UI after getting user info
  }

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
                        isSelected: _selectedMethod == PaymentMethod.paypal,
                        onTap: () {
                          setState(() {
                            _selectedMethod = PaymentMethod.paypal;
                          });
                        },
                      ),
                      PaymentMethodCard(
                        icon: Icons.account_balance_wallet,
                        label: 'None',
                        isSelected: _selectedMethod == PaymentMethod.none,
                        onTap: () {
                          setState(() {
                            _selectedMethod = PaymentMethod.none;
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
                      if (_selectedMethod == PaymentMethod.paypal) {
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
                                  "description": "${widget.seats}",
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
                                //convert data to fetching addpayment
                                String subtotal = params['data']['transactions']
                                    [0]['amount']['details']['subtotal'];
                                int quantity = params['data']['transactions'][0]
                                    ['item_list']['items'][0]['quantity'];
                                double subtotalConvert = double.parse(subtotal);
                                String date = widget.theater.date;
                                String time = widget.theater.time;
                                String datetime = '$date $time';
                                _selectedMethod == PaymentMethod.paypal
                                    ? method = 'PayPal'
                                    : 'None';
                                DateTime currentDate = DateTime.now();
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy HH:mm:ss')
                                        .format(currentDate);
                                String transactionDate =
                                    formattedDate.toString();
                                bool success = params['error'] == false &&
                                    params['message'] == 'Success';
                                if (success) {
                                  successPayment();
                                  PaymentAdding.addingPay(
                                    accountId: userId.toString(),
                                    dateTime: datetime,
                                    seatNumbers: convertedPositions,
                                    total: subtotalConvert,
                                    paymentMethod: method,
                                    quantity: quantity,
                                    numberTheater:
                                        widget.theater.number.toString(),
                                    transactionTime: transactionDate,
                                  );
                                }
                              },
                              onError: (error) {
                                print("onError: $error");
                              },
                              onCancel: (params) {
                                print('cancelled: $params');
                              },
                            ),
                          ),
                        );
                      } else if (_selectedMethod == PaymentMethod.none) {}
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
      ModalRoute.withName('/home'),
    );
  }
}

//format seats possition
int columnIndexFromLetter(String letter) {
  int codeUnitA = 'A'.codeUnitAt(0);
  int letterIndex = letter.toUpperCase().codeUnitAt(0) - codeUnitA;
  return letterIndex;
}

List<String> convertSeatPositions(List<String> seatPositions) {
  List<String> convertedPositions = [];
  for (String seatPosition in seatPositions) {
    List<String> parts = seatPosition.split(' ');
    if (parts.length != 2) {
      continue;
    }
    String rowLetter = parts[0];
    int colIndex = int.tryParse(parts[1]) ?? 0;
    int rowIndex = columnIndexFromLetter(rowLetter);
    if (rowIndex >= 0 && colIndex >= 0) {
      String converted =
          (rowIndex == 0 ? '0' : rowIndex.toString()) + colIndex.toString();
      convertedPositions.add(converted);
    }
  }
  return convertedPositions;
}
