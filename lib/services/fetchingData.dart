import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/model/category/category.dart';
import 'package:movie_booking/services/converter.dart';

class ListFeatured {
  static Future<List<Film>> fetchData(String dateStart, String dateEnd) async {
    try {
      const apiUrl = "http://192.168.1.3:8083/cinema/listfeatured";
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "dateStart": dateStart,
          "dateEnd": dateEnd,
        }),
      );

      return _handleResponse(response);
    } catch (error) {
      print('Network Request Error: $error');
      return List.empty();
    }
  }

  static List<Film> _handleResponse(http.Response response) {
    try {
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        return List<Film>.from(responseData.map((filmData) {
          List<dynamic> categories = filmData['categories'];
          List<Category> listCategory = List<Category>.from(
            categories.map((category) => Category(
                  id: category["id"],
                  name: category["name"],
                )),
          );

          return Film(
            id: filmData["id"],
            posters: filmData["posters"],
            title: filmData["title"],
            length: filmData["length"],
            dateRelease: filmData["releaseDate"],
            actor: filmData["actor"],
            director: filmData["director"],
            describe: byteToStringConvert(filmData["describe"]),
            categories: listCategory,
          );
        }));
      } else {
        print('Authentication Error: ${response.statusCode}');
        return List.empty();
      }
    } catch (error) {
      print('JSON Parsing Error: $error');
      return List.empty();
    }
  }
}
