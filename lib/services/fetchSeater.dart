import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/model/category/category.dart';
import 'package:movie_booking/model/threater.dart';
import 'package:movie_booking/services/converter.dart';

void main() {
  runApp(const MaterialApp(
    home: TestSeats(),
  ));
}

class TestSeats extends StatefulWidget {
  const TestSeats({Key? key}) : super(key: key);

  @override
  State<TestSeats> createState() => _TestingState();
}

class _TestingState extends State<TestSeats> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                try {
                  // Provide the actual values for dateStart and dateEnd
                  await ListFeatured.fetchDataSeats("1-11-2023 11:30:00", 3);
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: const Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListFeatured {
  static Future<void> fetchDataSeats(String date, int threater) async {
    try {
      const apiUrl = "http://192.168.1.3:8083/cinema/showMovieThreater";
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
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

          for (int i = 0; i < 6; i++) {
            List<int> seatRow = [];
            for (int j = 0; j < 6; j++) {
              seatRow.add(seatsData[i][j]);
            }
            seats.add(seatRow);
          }

          Threater threater = Threater(
              title: responseData["title"],
              date: responseData["date"],
              seat: seats);

          print(threater);
        } else {
          print('Authentication Error: ${response.statusCode}');
        }
      } catch (error) {
        print('JSON Parsing Error: $error');
      }
    } catch (error) {
      print('Network Request Error: $error');
    }
  }
}
