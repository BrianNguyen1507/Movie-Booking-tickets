import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_booking/model/threater.dart';
import 'package:movie_booking/services/ipconfig.dart';

class FetchingThreater {
  static Future<Threater> fetchDataSeats(String date, int threaterNum) async {
    Threater threater = Threater(datetime: "", seat: []);
    try {
      const apiUrl = "http://$ip:8083/cinema/showMovieThreater";
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "date": date,
          "numberThreater": threaterNum,
        }),
      );
      try {
        if (response.statusCode == 200) {
          final dynamic responseData = json.decode(response.body);
          List<dynamic> seatsData = responseData["seat"];
          List<List<int>> seats = [];

          for (int i = 0; i < 6; i++) {
            List<int> seatRow = [];
            for (int j = 0; j < 6; j++) {
              seatRow.add(seatsData[i][j]);
            }
            seats.add(seatRow);
          }

          Threater threater1 =
              Threater(datetime: responseData["date"], seat: seats);
          return threater1;
        } else {
          print('Authentication Error: ${response.statusCode}');
        }
      } catch (error) {
        print('JSON Parsing Error: $error');
      }
    } catch (error) {
      print('Network Request Error: $error');
    }
    return threater;
  }
}
