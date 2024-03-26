import 'dart:convert';

class Order {
  final int id;
  final String date;
  final int quantityTicket;
  final String paymentMethod;
  final int sumTotal;

  Order({
    required this.id,
    required this.date,
    required this.quantityTicket,
    required this.paymentMethod,
    required this.sumTotal,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      date: json['date'],
      quantityTicket: json['quantityTicket'],
      paymentMethod: json['paymentMethod'],
      sumTotal: json['sumtotal'],
    );
  }
}

List<Order> parseOrders(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Order>((json) => Order.fromJson(json)).toList();
}
