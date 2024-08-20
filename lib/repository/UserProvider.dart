
import 'package:flutter/material.dart';
import 'package:nawasena/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {

  final UserRepository _userProvider = UserRepository();

  Future<void> setSession(String session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("sessionToken", session);
  }

  getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String nextSessionUpdate = prefs.getString("sessionToken") ?? '';
      print(nextSessionUpdate);
      return nextSessionUpdate;
    } catch (e, stacktrace) {
      print(stacktrace);
      return '';
    }
  }

  // ThemeData _currentThemeData = ProjectTheme.getCurrentTheme();
  // ThemeData get currentTheme => _currentThemeData;
  // User _activeUser;
  // User get activeUser => _activeUser;
  //
  // set activeUser(User activeUser) {
  //   _activeUser = activeUser;
  //   notifyListeners();
  // }
  //
  // void updateTheme(ThemeData newTheme) {
  //   _currentThemeData = newTheme;
  //   notifyListeners();
  // }
}
