
import 'package:nawasena/models/LoginResponse.dart';

import '../models/all/AllResponse.dart';
import '../models/detail/DetailResponse.dart';
import '../models/drink/DrinkResponse.dart';
import '../models/food/FoodResponse.dart';
import '../models/news/newsResponse.dart';
import '../models/pupuk/PupukResponse.dart';
import '../models/rent/rentResponse.dart';
import 'api_caller.dart';

class ApiService {
  static Future<LoginResponse> login(ApiCaller apiProvider, String email, String password) async {
    final response = await apiProvider.authorizedPost('login', {'email': email, 'password': password});
    LoginResponse loginResponse = LoginResponse.fromJson(response);

    return loginResponse;
  }

  static Future<DrinkResponse> getList(ApiCaller apiProvider, String categories) async {
    final response = await apiProvider.get('$categories', {});
    DrinkResponse drinkResponse = DrinkResponse.fromJson(response);

    return drinkResponse;
  }

  static Future<FoodResponse> getListFood(ApiCaller apiProvider, String categories) async {
    final response = await apiProvider.get('$categories', {});
    FoodResponse foodResponse = FoodResponse.fromJson(response);

    return foodResponse;
  }

  static Future<AllResponse> getListAll(ApiCaller apiProvider, String categories) async {
    final response = await apiProvider.get('$categories', {});
    AllResponse allResponse = AllResponse.fromJson(response);

    return allResponse;
  }

  static Future<PupukResponse> getListPupuk(ApiCaller apiProvider, String categories) async {
    final response = await apiProvider.get('$categories', {});
    PupukResponse pupukResponse = PupukResponse.fromJson(response);

    return pupukResponse;
  }

  static Future<NewsResponse> getListNews(ApiCaller apiProvider, String categories) async {
    final response = await apiProvider.get('$categories', {});
    NewsResponse newsResponse = NewsResponse.fromJson(response);

    return newsResponse;
  }

  static Future<RentResponse> getListRent(ApiCaller apiProvider, String categories) async {
    final response = await apiProvider.get('$categories', {});
    RentResponse rentResponse = RentResponse.fromJson(response);

    return rentResponse;
  }

  static Future<DetailResponse> getDetail(ApiCaller apiProvider, String categories, String id) async {
    final response = await apiProvider.get('$categories/data/$id', {});
    DetailResponse detailResponse = DetailResponse.fromJson(response);

    return detailResponse;

  }

}
