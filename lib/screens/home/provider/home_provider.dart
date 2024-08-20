
import 'package:flutter/cupertino.dart';

import '../../../models/drink/DrinkResponse.dart' as drinkResponses;
import '../../../models/all/AllResponse.dart' as allResponses;
import '../../../models/pupuk/PupukResponse.dart' as pupukResponses;
import '../../../models/food/FoodResponse.dart' as foodResponses;
import '../../../repository/AuthRepository.dart';

enum ResultDrinkState { loading, noData, hasData, error }

enum ResultFoodState { loading, noData, hasData, error }

enum ResultAllState { loading, noData, hasData, error }

enum ResultPupukState { loading, noData, hasData, error }

class HomeProvider extends ChangeNotifier{
  HomeProvider(){
    dataDrink();
    dataFood();
    dataAll();
    dataPupuk();
  }

  List<drinkResponses.Data>? _items;
  List<drinkResponses.Data>? get items => _items;

  List<foodResponses.Data>? _itemsFood;
  List<foodResponses.Data>? get itemsFood => _itemsFood;

  List<allResponses.Data>? _itemsAll;
  List<allResponses.Data>? get itemsAll => _itemsAll;

  List<pupukResponses.Data>? _itemsPupuk;
  List<pupukResponses.Data>? get itemsPupuk => _itemsPupuk;

  ResultDrinkState? _stateDrink;
  ResultDrinkState? get stateDrink => _stateDrink;

  ResultFoodState? _stateFood;
  ResultFoodState? get stateFood => _stateFood;

  ResultAllState? _stateAll;
  ResultAllState? get stateAll => _stateAll;

  ResultPupukState? _statePupuk;
  ResultPupukState? get statePupuk => _statePupuk;

  void dataDrink() async {
    _stateDrink = ResultDrinkState.loading;
    notifyListeners();
    try{
      drinkResponses.DrinkResponse drinkResponse = await AuthRepository().getList('drinkDb');
      if(drinkResponse.status == 200){
        _stateDrink = ResultDrinkState.hasData;
        _items = drinkResponse.data;
        _items?.shuffle();
        notifyListeners();
      }
    }catch(e, stacktrace){
      print(e);
      print(stacktrace);
    }
  }

  void dataFood() async {
    _stateFood = ResultFoodState.loading;
    notifyListeners();
    try{
      foodResponses.FoodResponse foodResponse = await AuthRepository().getListFood('foodDb');
      if(foodResponse.status == 200){
        _stateFood = ResultFoodState.hasData;
        _itemsFood = foodResponse.data;
        _itemsFood?.shuffle();
        notifyListeners();
      }
    }catch(e, stacktrace){
      print(e);
      print(stacktrace);
    }
  }

  void dataAll() async {
    _stateAll = ResultAllState.loading;
    notifyListeners();
    try{
      allResponses.AllResponse allResponse = await AuthRepository().getListAll('allDb');
      if(allResponse.status == 200){
        _stateAll = ResultAllState.hasData;
        _itemsAll = allResponse.data;
        _itemsAll?.shuffle();
        notifyListeners();
      }
    }catch(e, stacktrace){
      print(e);
      print(stacktrace);
    }
  }

  void dataPupuk() async {
    _statePupuk = ResultPupukState.loading;
    notifyListeners();
    try{
      pupukResponses.PupukResponse pupukResponse = await AuthRepository().getListPupuk('pupukDb');
      if(pupukResponse.status == 200){
        _statePupuk = ResultPupukState.hasData;
        _itemsPupuk = pupukResponse.data;
        _itemsPupuk?.shuffle();
        notifyListeners();
      }
    }catch(e, stacktrace){
      print(e);
      print(stacktrace);
    }
  }

  // void toListPage(String categories) async {
  //   Navigator.pushNamed(context, ListPage.ro)
  //   Get.toNamed(ListPage.routedName, arguments: categories);
  // }
  //
  // void toDetailPage(String cat, int id) async {
  //   Get.toNamed(DetailPage.routedName, arguments: [
  //     {'categories': '$cat'},
  //     {'id': '$id'}
  //   ]);
  // }
  //
  // void toNewsDetailPage() async {
  //   Get.toNamed(NewsDetailPage.routedName);
  // }
}