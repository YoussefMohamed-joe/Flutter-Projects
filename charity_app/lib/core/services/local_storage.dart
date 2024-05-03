import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static cashData(String key, value) async {
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else {
      prefs.setStringList(key, value);
    }
  }

  static getData(String key) {
    return prefs.get(key);
  }

  static removeData(String key) {
    prefs.remove(key);
  }
}
