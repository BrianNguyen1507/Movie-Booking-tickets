import 'package:flutter/material.dart';

class TicketInfoScreen extends StatefulWidget {
  const TicketInfoScreen({super.key});

  @override
  _TicketInfoScreenState createState() => _TicketInfoScreenState();
}

class _TicketInfoScreenState extends State<TicketInfoScreen> {
  // Dummy data for ticket information
  final List<TicketInfo> ticketInfos = [
    TicketInfo(1, 'Inception', DateTime.now(), 2, 20.0),
    TicketInfo(2, 'The Dark Knight', DateTime.now(), 3, 30.0),
    TicketInfo(3, 'Interstellar', DateTime.now(), 4, 40.0),
    TicketInfo(4, 'Interstellar', DateTime.now(), 4, 40.0),
    TicketInfo(5, 'Interstellar', DateTime.now(), 4, 40.0),
    TicketInfo(6, 'Interstellar', DateTime.now(), 4, 40.0),
    TicketInfo(7, 'Interstellar', DateTime.now(), 4, 40.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Order tickets Information'),
      ),
      body: ListView.builder(
        itemCount: ticketInfos.length,
        itemBuilder: (context, index) {
          return TicketCard(ticketInfo: ticketInfos[index]);
        },
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final TicketInfo ticketInfo;

  const TicketCard({super.key, required this.ticketInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shadowColor: Colors.black,
      elevation: 5,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${ticketInfo.id}'),
            const SizedBox(height: 8.0),
            const Divider(
              color: Color.fromARGB(255, 172, 169, 169),
              thickness: 1,
            ),
            Text('Film: ${ticketInfo.filmName}'),
            const SizedBox(height: 8.0),
            Text('Date and Time: ${ticketInfo.dateTime}'),
            const SizedBox(height: 8.0),
            Text('Number of Seats: ${ticketInfo.numberOfSeats}'),
            const SizedBox(height: 8.0),
            Text('Total Price: \$${ticketInfo.totalPrice.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

class TicketInfo {
  final int id;
  final String filmName;
  final DateTime dateTime;
  final int numberOfSeats;
  final double totalPrice;

  TicketInfo(
    this.id,
    this.filmName,
    this.dateTime,
    this.numberOfSeats,
    this.totalPrice,
  );
}
