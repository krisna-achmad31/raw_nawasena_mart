
import 'package:flutter/material.dart';
import 'package:nawasena/screens/login/login_screen.dart';

class SplashScreenProvider extends ChangeNotifier{
  SplashScreenProvider(BuildContext context){
    waitingScreen(context);
  }


  void waitingScreen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3),() async {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }
}