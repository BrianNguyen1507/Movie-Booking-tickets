import 'package:http/http.dart' as http;
import 'package:movie_booking/services/AuthToken.dart';
import 'dart:convert';
import 'package:movie_booking/services/ipconfig.dart';

class PaymentAdding {
  static Future<bool> addingPay({
    required String dateTime,
    required List<String> seatNumbers,
    required double total,
    required String paymentMethod,
    required int quantity,
    required String numberTheater,
    required String transactionTime,
  }) async {
    try {
      dynamic token = await TokenAuthenticated.getToken();

      const String apiUrl = "http://$ip:8083/cinema/addPayment";

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "datetime": transactionTime,
          "seat": seatNumbers,
          "sumtotal": total,
          "paymentMethod": paymentMethod,
          "quantityTicket": quantity,
          "numberThreater": numberTheater,
          "dateMovieThreater": dateTime,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Payment Adding Error: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Exception: $error');
      return false;
    }
  }
}
