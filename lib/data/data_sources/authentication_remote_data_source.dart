import 'package:movies_app/data/core/dio_helper.dart';
import 'package:movies_app/data/models/request_token_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> dataParams);
  Future<String> createSession(Map<String, dynamic> dataParams);
  Future<bool> deleteSession(String sessionId);
}

class AuthenticationRemoteDataSourceImpl extends AuthenticationRemoteDataSource {
  @override
  Future<RequestTokenModel> getRequestToken() async {
    final response = await DioHelper.get(url: 'authentication/token/new');
    print(response);
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> dataParams) async {
    final response = await DioHelper.post(
      url: 'authentication/token/validate_with_login',
      dataParams: dataParams,
    );
    print(response);
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<String> createSession(Map<String, dynamic> dataParams) async {
    final response = await DioHelper.post(
      url: 'authentication/session/new',
      dataParams: dataParams,
    );
    print(response);
    return response['success'] ? response['session_id'] : null;
  }

  @override
  Future<bool> deleteSession(String sessionId) async {
    final response = await DioHelper.delete(
      url: 'authentication/session',
      dataParams: {
        'session_id': sessionId,
      },
    );
    print(response);
    return response['success'] ?? null;
  }
}
