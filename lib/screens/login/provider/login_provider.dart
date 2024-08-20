
import 'package:flutter/material.dart';

enum ResultLoginState { loading, noData, hasData, error }

class LoginProvider extends ChangeNotifier{

  ResultLoginState? _stateLogin;
  ResultLoginState? get stateLogin => _stateLogin;
}