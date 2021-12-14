import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:football_trivia/core/network/gen_req_helpers/interceptors.dart';
import 'package:football_trivia/core/network/gen_req_helpers/urls_routes.dart';

class TriviaGeneralNetworkService {
  static String get baseUrl => dotenv.env['API_URL'].toString();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

//get Request for trivia users
  Future getRequest(String url, {Map<String, dynamic>? data}) async {
    try {
      Response response = await _dio.get(baseUrl + url, queryParameters: data);

      // ignore: avoid_print
      debugPrint('Response Info: ${response.data}');
      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        return e.response?.data;
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
        return null;
      }
    }
  }

// /gpost Request for trivia users
  Future postRequest(String url, Map<String, dynamic>? data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.post(
        baseUrl + url,
        data: data,
        queryParameters: queryParameters,
      );

      // ignore: avoid_print
      debugPrint('Response Info: ${response.data}');
      if (response.statusCode == 302) {
        return null;
      }
      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        if (e.response?.statusCode == 302) {
          return null;
        }
        return e.response?.data;
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);

        return null;
      }
    }
  }

  // / /gpost Request for trivia users
  Future deleteRequest(String url, Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.delete(baseUrl + url, data: data);

      // ignore: avoid_print
      debugPrint('Response Info: ${response.data}');

      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        return e.response?.data;
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
        return null;
      }
    }
  }

//this returns an image and some other data tothe server to the server
  Future uploadImageAndFormData(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      Response response =
          await _dio.post(ProfileUrls.updateProfile, data: formData);

      debugPrint('Response Info: ${response.data}');
      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        return e.response?.data;
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
        return null;
      }
    }
  }
}

class FootballNetworkServices {
  static String get footballBaseUrl =>
      dotenv.env['FOOTBALL_API_URL'].toString();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: footballBaseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

//get Request for trivia users
  Future getRequest<TriviaQuestionModel>(String url,
      {Map<String, dynamic>? data}) async {
    try {
      Response response =
          await _dio.get(footballBaseUrl + url, queryParameters: data);
      var _res = jsonDecode(response.data);

      // ignore: avoid_print
      debugPrint('Response Info: ${response.data}');
      if (response.statusCode == 200) {
        Map questionsResponse = jsonDecode(response.data);
        List<dynamic> questions = questionsResponse["data"];
      }
      return _res;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        return e.response?.data;
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
        return null;
      }
    }
  }

// /gpost Request for trivia users
  Future postRequest(String url, Map<String, dynamic>? data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.post(
        footballBaseUrl + url,
        data: data,
        queryParameters: queryParameters,
      );

      // ignore: avoid_print
      debugPrint('Response Info: ${response.data}');
      var _res = jsonDecode(response.data);
      return _res;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        return e.response?.data;
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);

        return null;
      }
    }
  }

  // / /gpost Request for trivia users
  Future deleteRequest(String url, Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.delete(footballBaseUrl + url, data: data);

      // ignore: avoid_print
      debugPrint('Response Info: ${response.data}');
      var _res = jsonDecode(response.data);
      return _res;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        return e.response?.data;
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
        return null;
      }
    }
  }
}

class NewsGeneralServices {
  static String get footballBaseUrl =>
      "https://real-time-football-content.p.rapidapi.com/football";
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: footballBaseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

//get Request for trivia users
  Future getRequest({String? url, Map<String, dynamic>? data}) async {
    try {
      Response response =
          await _dio.get(footballBaseUrl + url!, queryParameters: data);

      // ignore: avoid_print
      debugPrint('Response Info: ${response.data}');

      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        return e.response?.data;
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
        return null;
      }
    }
  }

// /gpost Request for trivia users
  Future postRequest(String url, Map<String, dynamic>? data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.post(
        footballBaseUrl + url,
        data: data,
        queryParameters: queryParameters,
      );

      // ignore: avoid_print
      debugPrint('Response Info: ${response.data}');

      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        return e.response?.data;
      } else {
        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);

        return null;
      }
    }
  }
}
