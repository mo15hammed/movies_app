import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/data/core/unauthorized_exception.dart';

class DioHelper {
  static Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.BASE_URL,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
        queryParameters: {
          'api_key': ApiConstants.API_KEY,
        },
      ),
    );
  }

  static Future<dynamic> get({
    @required String url,
    Map<String, dynamic> queryParams,
  }) async {
    queryParams?.addAll(_dio.options.queryParameters);
    final response = await _dio.get(url, queryParameters: queryParams);

    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    } else {
      throw DioError(
        error: '${response.statusCode} ${response.statusMessage}',
        type: DioErrorType.response,
        requestOptions: response.requestOptions,
      );
    }
  }

  static Future<dynamic> post({
    @required String url,
    Map<String, dynamic> queryParams,
    Map<String, dynamic> dataParams,
  }) async {
    final response = await _dio.post(url, queryParameters: queryParams, data: dataParams);

    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    } else if (response.statusCode == HttpStatus.unauthorized ) {
      throw UnauthorizedException();
    } else {
      throw DioError(
        error: '${response.statusCode} ${response.statusMessage}',
        type: DioErrorType.response,
        requestOptions: response.requestOptions,
      );
    }
  }

  static Future<dynamic> delete({
    @required String url,
    Map<String, dynamic> queryParams,
    Map<String, dynamic> dataParams,
  }) async {
    final response = await _dio.delete(url, queryParameters: queryParams, data: dataParams);

    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    } else if (response.statusCode == HttpStatus.unauthorized ) {
      throw UnauthorizedException();
    } else {
      throw DioError(
        error: '${response.statusCode} ${response.statusMessage}',
        type: DioErrorType.response,
        requestOptions: response.requestOptions,
      );
    }
  }
}
