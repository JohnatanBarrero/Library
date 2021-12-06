import 'package:shared_preferences/shared_preferences.dart';

class LibraryPreferences {
  static final LibraryPreferences _instance = LibraryPreferences._internal();

  //Esto es el singleton
  factory LibraryPreferences() {
    return _instance;
  }
  LibraryPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }
}
