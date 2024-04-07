import 'package:flutter/material.dart';
import 'package:movie_booking/model/order/Order.dart';
import 'package:movie_booking/services/fetching/fetchOrdered.dart';

class OrderedMovie extends StatefulWidget {
  const OrderedMovie({Key? key}) : super(key: key);

  @override
  State<OrderedMovie> createState() => _OrderedMovieState();
}

class _OrderedMovieState extends State<OrderedMovie> {
  List<Order>? orderList;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchOrderData();
  }

  Future<void> fetchOrderData() async {
    setState(() {
      isLoading = true;
    });
    try {
      List<Order> fetchedOrders = await FetchOrder().fetchOrdered();
      fetchedOrders.sort((a, b) => b.id.compareTo(a.id));
      setState(() {
        orderList = fetchedOrders;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching orders: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(isLoading ? 'Loading...' : 'Order tickets Information'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : orderList == null || orderList!.isEmpty
              ? const Center(
                  child: Text('No tickets available'),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: orderList!.length,
                  itemBuilder: (context, index) {
                    return TicketCard(order: orderList![index]);
                  },
                ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final Order order;

  const TicketCard({Key? key, required this.order}) : super(key: key);

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
            Text('Order ID: ${order.id}'),
            const SizedBox(height: 8.0),
            const Divider(
              color: Color.fromARGB(255, 172, 169, 169),
              thickness: 1,
            ),
            Text('Date Time Order: ${order.date}'),
            const SizedBox(height: 8.0),
            Text('Payment Method: ${order.paymentMethod}'),
            const SizedBox(height: 8.0),
            Text('Ticket Quantity: ${order.quantityTicket}'),
            const SizedBox(height: 8.0),
            Text('Total Price: \$${order.sumTotal}'),
          ],
        ),
      ),
    );
  }
}
