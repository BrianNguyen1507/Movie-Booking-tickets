import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/model/category/category.dart';
import 'package:movie_booking/services/ipconfig.dart';

class ListFeatured {
  static Future<List<Film>> fetchData(String dateStart, String dateEnd) async {
    try {
      const apiUrl = "http://$ip:8083/cinema/listfeatured";
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
      return List.empty();
    }
  }

  static Uint8List base64ToUint8(String str) {
    return base64Decode(str);
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
            describe: filmData["describe"],
            categories: listCategory,
            price: filmData["price"],
          );
        }));
      } else {
        print('Authentication Error: ${response.statusCode}  ');
        return List.empty();
      }
    } catch (error) {
      print('JSON Parsing Error: $error');
      return List.empty();
    }
  }

  static Future<ui.Image> bytesToImage(String base64String) async {
    try {
      Uint8List imgBytes = base64ToUint8(base64String);
      ui.Codec codec = await ui.instantiateImageCodec(imgBytes);
      ui.FrameInfo frame = await codec.getNextFrame();
      return frame.image;
    } catch (e) {
      print('Error decoding image: $e');
      rethrow;
    }
  }
}
