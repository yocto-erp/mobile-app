import 'dart:convert';
import 'package:flui/flui.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:mobile/model/api/exception/access-denied.dart';
import 'package:mobile/model/api/exception/bad-request.dart';
import 'package:mobile/model/api/exception/internal-error.dart';
import 'package:mobile/model/api/login-response.dart';
import 'package:mobile/service/storage.dart';
import 'package:dio/dio.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(
  String text,
) {
  return compute(_parseAndDecode, text);
}

class Api {
  Storage storage;
  final Dio dio = new Dio();

  Logger logger = Logger();

  Api(this.storage) {
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    //dio.options.baseUrl = "http://192.168.5.164:3000/mobile";
    dio.options.baseUrl = "http://192.168.1.28:3000/mobile";
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      Map<String, dynamic> headers = {
        'content-type': 'application/json',
        'bearer': await this.storage.load()
      };
      options.headers.addAll(headers);
      return options;
    }));
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<LoginResponse> login(String username, String password) async {
    Response<dynamic> res = await this
        .post("/sign-in", {"username": username, "password": password});
    logger.i(res);
    return LoginResponse.fromJson(res.data);
  }

  Future<Response<dynamic>> post(url, Map<String, dynamic> data) async {
    try {
      return await this.dio.post(url, data: data);
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  handleError(DioError e) {
    switch (e.type) {
      case DioErrorType.RESPONSE:
        switch (e.response.statusCode) {
          case 400:
            return BadRequestException.fromJSON(e.response.data);
          case 403:
            return AccessDeniedException(e.response.statusMessage);
          default:
            return InternalException(e.response.statusMessage);
        }
        break;
      default:
        FLToast.error(text: e.message);
        return InternalException(e.message);
    }
  }
}
