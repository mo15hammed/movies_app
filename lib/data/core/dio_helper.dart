import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app/data/core/api_constants.dart';

class DioHelper {
  static Dio _dio;

  static init() {
    _dio =
        Dio(BaseOptions(baseUrl: ApiConstants.BASE_URL, receiveDataWhenStatusError: true, headers: {
      'Content-Type': 'application/json',
    }, queryParameters: {
      'api_key': ApiConstants.API_KEY,
    }));
  }

  static Future<dynamic> get({
    @required String url,
    Map<String, dynamic> query,
  }) async {
    final response = await _dio.get(url, queryParameters: query);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw DioError(
        error: '${response.statusCode} ${response.statusMessage}',
        type: DioErrorType.response,
        requestOptions: response.requestOptions,
      );
    }
  }
}
