import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  final String apiUrl;

  ApiHelper(this.apiUrl);

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        print(data);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
    }
  }
}
