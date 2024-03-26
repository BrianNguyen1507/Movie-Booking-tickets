import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_booking/model/theater/theater.dart';
import 'package:movie_booking/services/ipconfig.dart';

class FetchTheater {
  Future<List<Theater>> fetchTheaterData(int id) async {
    var url = 'http://$ip:8083/cinema/showMovieThreater?id=$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<Theater> theaters = [];

      for (var data in jsonData) {
        if (data is Map<String, dynamic> && data.isNotEmpty) {
          theaters.add(Theater.fromJson(data));
        } else {
          throw Exception('Invalid theater data format');
        }
      }

      return theaters;
    } else {
      throw Exception('Failed to load theater data: ${response.statusCode}');
    }
  }
}
