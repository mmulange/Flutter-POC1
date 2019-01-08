import 'package:shared_preferences/shared_preferences.dart';
import 'package:first_project/utils/Constatnts.dart';

class SharedPreferencesHelper {

  static  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(Constants.IS_LOGGED_IN) ?? false;
  }

  static  Future<bool> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(Constants.IS_LOGGED_IN, value);
  }
}
