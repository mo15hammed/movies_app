import 'package:dio/dio.dart';
import 'package:movies_app/common/constants/api_constants.dart';

class DioHelper {
  final Dio _dio;

  DioHelper(this._dio);

  dynamic get(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    final res = await _dio.get(
      ApiConstants.baseUrl + path,
      queryParameters: {...?queryParams, 'api_key': ApiConstants.apiKey},
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (res.statusCode == 200) {
      return res.data;
    } else {
      throw Exception(res.statusMessage);
    }
  }
}
