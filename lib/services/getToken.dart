import 'package:movie_booking/services/authenticate.dart';

class TokenAuthenticated {
  Future<dynamic> getToken() async {
    dynamic token;
    token = await storage.read(key: 'token');
    return token;
  }
}
