import 'dart:convert';
import 'package:movie_booking/model/category/category.dart';

class Film {
  final int id;
  final dynamic posters;
  final String title;
  final String length;
  final String dateRelease;
  final String actor;
  final String director;
  final String describe;
  final List<Category> categories;

  Film({
    required this.id,
    required this.posters,
    required this.title,
    required this.length,
    required this.dateRelease,
    required this.actor,
    required this.director,
    required this.describe,
    required this.categories,
  });

  // Factory method to create a Film instance from a JSON map
  factory Film.fromJson(Map<String, dynamic> json) {
    // Ensure that 'posters' is parsed correctly as a List<String>
    List<String> postersList = List<String>.from(json['posters'] ?? []);

    // Ensure that 'categories' is parsed correctly as a List<Category>
    List<Category> categoriesList = List<Category>.from(
      (json['categories'] ?? []).map((category) => Category.fromJson(category)),
    );

    return Film(
      id: json['id'],
      posters: postersList,
      title: json['title'],
      length: json['length'],
      dateRelease: json['releaseDate'],
      actor: json['actor'],
      director: json['director'],
      describe: json['describe'],
      categories: categoriesList,
    );
  }
}
