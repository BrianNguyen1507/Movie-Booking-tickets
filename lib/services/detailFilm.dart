import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:movie_booking/model/film/film.dart';

Future<void> _fetchFilmDetails(String id) async {
  final Uri uri = Uri.parse('http://192.168.1.3:8083/cinema/detailFilm?id=$id');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // Parse the JSON response
    final Map<String, dynamic> data = json.decode(response.body);

    // Assuming your Film class has a fromJson factory constructor
    Film film = Film.fromJson(data);

    // Now you can use the film object or print its details
    print('Film Title: ${film.title}');
    print('Categories: ${film.categories}');
    print('Running Time: ${film.length}');
    // Add other properties as needed
  } else {
    // Handle errors
    print('Failed to fetch film details: ${response.statusCode}');
  }
}
