import 'package:http/http.dart' as http;
import 'package:movie_booking/model/seats/seats.dart';
import 'package:movie_booking/services/AuthToken.dart';
import 'dart:convert';

import 'package:movie_booking/services/ipconfig.dart';

class FetchSeats {
  static Future<Seat?> fetchDataSeats(String date, int threater) async {
    dynamic token = await TokenAuthenticated.getToken();
    try {
      const apiUrl = "http://$ip:8083/cinema/showSeat";
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "date": date,
          "numberThreater": threater,
        }),
      );
      try {
        if (response.statusCode == 200) {
          final dynamic responseData = json.decode(response.body);
          List<dynamic> seatsData = responseData["seat"];
          List<List<int>> seats = [];

          for (var row in seatsData) {
            List<int> parsedRow = [];
            for (var seat in row) {
              parsedRow.add(seat);
            }
            seats.add(parsedRow);
          }

          String datetime = responseData["date"];
          return Seat(seats, datetime: datetime);
        } else {
          throw Exception('Authentication Error: ${response.statusCode}');
        }
      } catch (error) {
        // Handle JSON Parsing Error
        print('JSON Parsing Error: $error');
        return null;
      }
    } catch (error) {
      // Handle Network Request Error
      print('Network Request Error: $error');
      return null;
    }
  }
}
