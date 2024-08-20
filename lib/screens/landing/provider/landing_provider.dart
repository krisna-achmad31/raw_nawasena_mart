
import 'package:flutter/cupertino.dart';
import 'package:nawasena/screens/mainPage/main_page_screen.dart';
import 'package:nawasena/screens/rent/rent_screen.dart';

class LandingProvider extends ChangeNotifier {

  LandingProvider(BuildContext context){
    waitingScreen(context);
  }

  void waitingScreen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushNamedAndRemoveUntil(context, MainPageScreen.routeName, (Route<dynamic> route) => false);
    });
  }

}