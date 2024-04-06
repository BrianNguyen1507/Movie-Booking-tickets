import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_booking/model/order/Order.dart';
import 'package:movie_booking/services/AuthToken.dart';
import 'package:movie_booking/services/ipconfig.dart';

class FetchOrder {
  Future<List<Order>> fetchOrdered() async {
    dynamic token = await TokenAuthenticated.getToken();
    var url = 'http://$ip:8083/cinema/getOrder';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<Order> orders = [];
      for (var data in jsonData) {
        if (data is Map<String, dynamic> && data.isNotEmpty) {
          orders.add(Order.fromJson(data));
        } else {
          throw Exception('Invalid theater data format');
        }
      }

      return orders;
    } else {
      print(token);
      throw Exception('Failed to load theater data: ${response.statusCode}');
    }
  }
}
