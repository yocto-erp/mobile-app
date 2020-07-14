import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static const String TOKEN = "TOKEN";
  String token;

  load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.token = prefs.getString(TOKEN);
    return this.token;
  }

  setToken(String _token) async {
    this.token = _token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(TOKEN, _token);
  }
}
