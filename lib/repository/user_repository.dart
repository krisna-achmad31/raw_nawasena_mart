import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {

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
  // Future<void> saveUser(User user) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String userString = jsonEncode(user);
  //   await prefs.setString("activeUser", userString);
  // }
  //
  // Future<void> deleteUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("activeUser", "");
  // }
  //
  // Future<User> getUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try {
  //     String userString = prefs.getString("activeUser");
  //     print(userString);
  //     User activeUser = User.fromJson(jsonDecode(userString));
  //     return activeUser;
  //   } catch (e, stacktrace) {
  //     print(stacktrace);
  //     return null;
  //   }
  // }
  //
  // Future<void> saveToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("activeToken", token);
  // }
  //
  // Future<String> getToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try {
  //     String token = prefs.getString("activeToken");
  //     return token;
  //   } catch (e, stacktrace) {
  //     print(stacktrace);
  //     return null;
  //   }
  // }
}
