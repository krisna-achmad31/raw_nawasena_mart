

import '../models/LoginResponse.dart';
import '../models/all/AllResponse.dart';
import '../models/detail/DetailResponse.dart';
import '../models/drink/DrinkResponse.dart';
import '../models/food/FoodResponse.dart';
import '../models/news/newsResponse.dart';
import '../models/pupuk/PupukResponse.dart';
import '../models/rent/rentResponse.dart';
import '../network/api_caller.dart';
import '../network/api_service.dart';

class AuthRepository {
  ApiCaller _apiProvider = ApiCaller();

  Future<LoginResponse> login(String email, String password) async {
    LoginResponse loginResponse = await ApiService.login(_apiProvider, email, password);
    if (loginResponse.response == 200.toString()) {
      print('Success');
    }
    return loginResponse;
  }

  Future<DrinkResponse> getList(String categories) async {
    DrinkResponse drinkResponse = await ApiService.getList(_apiProvider, categories);

    return drinkResponse;
  }

  Future<FoodResponse> getListFood(String categories) async {
    FoodResponse foodResponse = await ApiService.getListFood(_apiProvider, categories);

    return foodResponse;
  }

  Future<AllResponse> getListAll(String categories) async {
    AllResponse allResponse = await ApiService.getListAll(_apiProvider, categories);

    return allResponse;
  }

  Future<PupukResponse> getListPupuk(String categories) async {
    PupukResponse pupukResponse = await ApiService.getListPupuk(_apiProvider, categories);

    return pupukResponse;
  }

  Future<NewsResponse> getListNews(String categories) async {
    NewsResponse newsResponse = await ApiService.getListNews(_apiProvider, categories);

    return newsResponse;
  }

  Future<RentResponse> getListRent(String categories) async {
    RentResponse rentResponse = await ApiService.getListRent(_apiProvider, categories);

    return rentResponse;
  }

  Future<DetailResponse> getDetail(String categories, String id) async {
    DetailResponse detailResponse = await ApiService.getDetail(_apiProvider, categories, id);

    return detailResponse;
  }

}