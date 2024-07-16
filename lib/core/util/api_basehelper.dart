import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../error/exceptions.dart';


enum CodeStatus { defaultCode, activation }

class ApiBaseHelper {
  final String _baseUrl = 'https://rabe7.x-freee.com';
  final Dio dio = Dio();
  void dioInit() {
    dio.options.baseUrl = _baseUrl;
    dio.options.headers = headers;
    dio.options.sendTimeout = const Duration(milliseconds: 30000); // time in ms
    dio.options.connectTimeout =
        const Duration(milliseconds: 30000); // time in ms
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);
  }

  void updateLocalInHeaders(String local) {
    headers['Lang'] = local;
    dio.options.headers = headers;
  }

  ApiBaseHelper();
  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json',
  };

  Future<dynamic> get({required String url, String? token}) async {
    try {
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        dio.options.headers = headers;
        log(url + token);
      }
      log(url);
      final Response response = await dio.get(url);
      final responseJson = _returnResponse(response);
      log(responseJson.toString());
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log(e.toString());
      log(e.response?.toString() ?? 'no response');
      String message =
          e.response?.data['message'] ?? tr('error_please_try_again');
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        message = tr('error_no_internet');
      }
      throw ServerException(message: message);
    }
  }

  Future<dynamic> put({
    required String url,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      final Response response;
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        dio.options.headers = headers;
        log(url + token);
      }
      log(body.toString());
      if (body != null) {
        response = await dio.put(url, data: body);
      } else {
        response = await dio.put(url);
      }
      final responseJson = _returnResponse(response);
      log(responseJson.toString());
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log(e.toString());
      log(e.response?.toString() ?? 'no response');
      String message =
          e.response?.data['message'] ?? tr('error_please_try_again');
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        message = tr('error_no_internet');
      }
      throw ServerException(message: message);
    }
  }

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    try {
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        dio.options.headers = headers;
        log(_baseUrl + url + token);
      } else {
        headers.remove('Authorization');
        dio.options.headers = headers;
      }
      log(url);
      log('body \n$body');
      log('headers \n${dio.options.headers}');
      FormData formData = FormData.fromMap(body);
      final Response response = await dio.post(url, data: formData);
      final responseJson = _returnResponse(response);
      log(responseJson.toString());
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log('DioException ----->$e');
      log('DioException ----->${e.response?.data}');
      _returnResponse(e.response);
    }
  }

  Future<dynamic> postWithRaw(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    try {
      if (token != null) {
        headers['token'] = token;
        dio.options.headers = headers;
        log(url + token);
      }
      log(headers.toString());
      log(body.toString());
      log(url);
      final Response response = await dio.post(url, data: body);
      final responseJson = _returnResponse(response);
      log(responseJson.toString());
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log('DioException ----->$e');
      log('DioException ----->${e.response?.data}');
      _returnResponse(e.response);
    }
  }

  Future<dynamic> postWithImage(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    try {
      dio.options.sendTimeout =
          const Duration(milliseconds: 30000); // time in ms
      dio.options.connectTimeout =
          const Duration(milliseconds: 30000); // time in ms
      dio.options.receiveTimeout = const Duration(milliseconds: 30000);
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        dio.options.headers = headers;
        log(url + token);
      }
      log(body.toString());
      log(url);
      log(dio.options.headers.toString());
      FormData formData = FormData.fromMap(body);
      final Response response = await dio.post(url, data: formData);
      final responseJson = _returnResponse(response);
      log(responseJson.toString());
      dio.options.sendTimeout =
          const Duration(milliseconds: 8000); // time in ms
      dio.options.connectTimeout =
          const Duration(milliseconds: 8000); // time in ms
      dio.options.receiveTimeout = const Duration(milliseconds: 8000);
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log(e.toString());
      log('e.response?.data.${e.response?.data}');
      String message =
          e.response?.data['message'] ?? tr('error_please_try_again');
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        message = tr('error_no_internet');
      }
      throw ServerException(message: message);
    }
  }

  Future<dynamic> delete({required String url, String? token}) async {
    try {
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        dio.options.headers = headers;
      }
      final Response response = await dio.delete(url);
      log(url);
      final responseJson = _returnResponse(response);
      log(responseJson.toString());
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log(e.toString());
      String message =
          e.response?.data['message'] ?? tr('error_please_try_again');
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        message = tr('error_no_internet');
      }
      throw ServerException(message: message);
    }
  }

  Future<dynamic> uploadImage({required String url, required File file}) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(<String, dynamic>{
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final Response response = await dio.post(url, data: formData);
      final responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log(e.toString());
      String message =
          e.response?.data['message'] ?? tr('error_please_try_again');
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        message = tr('error_please_try_again');
      }
      throw ServerException(message: message);
    }
  }
  //

  dynamic _returnResponse(Response? response) {
    if (response == null) {
      throw ServerException(
        message: tr('error_no_internet'),
      );
    }
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw ServerException(
            message: response.data['message'], errorMap: response.data['data']);
      case 422:
        throw response.data.toString();
      case 401:
      case 403:
        throw ServerException(message: response.data);
      case 500:
      default:
        throw ServerException(message: tr('error_no_internet'));
    }
  }
}