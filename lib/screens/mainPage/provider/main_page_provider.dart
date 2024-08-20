
import 'package:flutter/cupertino.dart';

class MainPageProvider extends ChangeNotifier{


  int? _children = 0;
  int? get children => _children;

  void changeTabIndex(int index){
    _children = index;
    notifyListeners();
  }
}