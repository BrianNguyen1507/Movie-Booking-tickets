import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<void> savingSelectionUsers(
      String date, int number, String time) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_date', date);
    await prefs.setInt('selected_number', number);
    await prefs.setString('selected_time', time);
  }

  Future<void> removeData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
