import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_booking/services/ipconfig.dart';

class PaymentAdding {
  static Future<bool> addingPay({
    required String accountId,
    required String dateTime,
    required List<String> seatNumbers,
    required double total,
    required String paymentMethod,
    required int quantity,
    required String numberTheater,
    required String transactionTime,
  }) async {
    try {
      const String apiUrl = "http://$ip:8083/cinema/addPayment";

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "accountId": accountId,
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
