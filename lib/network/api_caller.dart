import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/SessionResponse.dart';
import '../repository/user_repository.dart';
import 'network_exception.dart';

class ApiCaller {

  // final String _baseUrl = "https://appdev.ifdemo.com/vingeek_cms/apis/v1";
  final String _baseUrl = "https://nawasena-2d2a7-default-rtdb.firebaseio.com";
  final UserRepository _userProvider = UserRepository();

  String getBaseUrl(){
    return _baseUrl;
  }

  Future<dynamic> get(String url, Object body) async {
    var responseJson;
    try {
      final uri = Uri.parse("$_baseUrl/$url.json");
      print(uri);
      final response = await http.get(uri);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> authorizedPost(String url, Object body) async {
    final sessionGenerator = await post('session', {'username': 's_username', 'password': 's_password'});
    SessionResponse sessionResponse = SessionResponse.fromJson(sessionGenerator);
    if (sessionResponse.success) {
      _userProvider.setSession(sessionResponse.dataArray.sessionId);
      var responseJson;
      try {
        print("$_baseUrl/$url/");
        print(body);
        var jsonBody = json.encode(body);
        print(jsonBody);

        String session = await _userProvider.getSession();
        print(session);
        final uri = Uri.parse("$_baseUrl/$url/");
        final response = await http.post(uri, body: jsonBody, headers: {'Sessionid': 'Basic $session'});
        responseJson = _response(response);
      } on SocketException {
        throw FetchDataException('No Internet connection');
      }
      return responseJson;
    } else {
      print('Session Generate Error');
      return null;
    }


  }

  Future<dynamic> post(String url, Object body) async {
    var responseJson;
    try {
      print("$_baseUrl/$url/");
      var jsonBody = json.encode(body);
      print(jsonBody);

      final uri = Uri.parse("$_baseUrl/$url/");
      final response = await http.post(uri, body: jsonBody);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  // // final String _baseUrl = "https://api.bersee.id/v1";
  // final String _baseUrl = "https://stg.bersee.id/v1";
  // final UserRepository _userProvider = UserRepository();
  //
  // Future<dynamic> get(String url, Map param) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(param);
  //     String queryString = Uri(queryParameters: param).query;
  //     final uri = Uri.parse("$_baseUrl/$url?$queryString");
  //     final response = await http.get(uri);
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> post(String url, Object body) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(body);
  //     final uri = Uri.parse("$_baseUrl/$url");
  //     final response = await http.post(uri, body: body);
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> authorizedGet(String url, Map param) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(param);
  //     String token = await _userProvider.getToken();
  //     print(token);
  //     String queryString = "";
  //     if (param.isNotEmpty) {
  //       queryString = Uri(queryParameters: param).query;
  //     }
  //     final uri = Uri.parse("$_baseUrl/$url?$queryString");
  //     final response = await http.get(uri, headers: {HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> authorizedPost(String url, Object body) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(body);
  //     String token = await _userProvider.getToken();
  //     final uri = Uri.parse("$_baseUrl/$url");
  //     final response = await http.post(uri, body: body, headers: {HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> authorizedPatch(String url, Object body) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(body);
  //     String token = await _userProvider.getToken();
  //     final uri = Uri.parse("$_baseUrl/$url");
  //     final response = await http.patch(uri, body: body, headers: {HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> authorizedDelete(String url, Object body) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(body);
  //     String token = await _userProvider.getToken();
  //     final uri = Uri.parse("$_baseUrl/$url");
  //     final response = await http.delete(uri, body: body, headers: {HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  dynamic _response(http.Response response) {
    print('response result => ${response.body.toString()}');
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print('case 200 result => $responseJson');
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 402:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 500:

      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
