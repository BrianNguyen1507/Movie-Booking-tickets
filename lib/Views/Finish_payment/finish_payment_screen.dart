import 'package:flutter/material.dart';
import 'package:movie_booking/Views/order_tickets/order_tickets_screen.dart';

class SummaryPaymentPage extends StatefulWidget {
  const SummaryPaymentPage({Key? key}) : super(key: key);

  @override
  State<SummaryPaymentPage> createState() => _SummaryPaymentPageState();
}

class _SummaryPaymentPageState extends State<SummaryPaymentPage> {
  Widget renderInfo(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: const Text(
            'NAME OF MOVIE SELECTED',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 10),
          child: const Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Colors.grey,
              ),
              Text(
                ' Date time: asdsaas',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 10),
          child: const Row(
            children: [
              Icon(
                Icons.chair_outlined,
                color: Colors.grey,
              ),
              Text(
                ' Seating position: A1,A2',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget renderOrdered(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: const Text(
            'Item Ordered',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              child: const Row(
                children: [
                  Icon(
                    Icons.add_box_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    ' x2 Adult Stand-2D',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: const Text(
                ' \$26',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildPaymentMethodRadio(String method) {
    return Row(
      children: [
        Radio(
          fillColor: const MaterialStatePropertyAll(Colors.grey),
          value: method,
          groupValue: selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              selectedPaymentMethod = value.toString();
            });
          },
        ),
        Text(
          method,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  String selectedPaymentMethod = '';

  Widget renderPaymentMethod(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              child: const Row(
                children: [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: Colors.grey,
                  ),
                  Text(
                    ' Subtotal :',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: const Text(
                ' \$26',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: const Text(
            'Payment Method',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        buildPaymentMethodRadio('Visa'),
        buildPaymentMethodRadio('PayPal'),
        buildPaymentMethodRadio('Banking'),
      ],
    );
  }

  Widget renderPaymentConfirm(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 41, 189, 58),
            elevation: 0.0),
        onPressed: () {
          // Add logic to handle the selected payment method
          if (selectedPaymentMethod.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TicketInfoScreen(),
              ),
            );
            print('Selected Payment Method: $selectedPaymentMethod');
          } else {
            // Display an error message or handle accordingly
            print('Please select a payment method');
          }
        },
        child: const Text(
          'Finish Payment',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget renderBody(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderInfo(context),
            renderOrdered(context),
            renderPaymentMethod(context),
          ],
        )),
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Booking Summary'),
      ),
      body: Column(
        children: [
          renderBody(context),
          renderPaymentConfirm(context),
        ],
      ),
    );
  }
}
