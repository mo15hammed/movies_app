import 'package:equatable/equatable.dart';
import 'package:movies_app/common/constants/translation_constants.dart';

class AppError extends Equatable {
  final String message;
  final AppErrorType errorType;

  const AppError({
    this.message,
    this.errorType = AppErrorType.api,
  });

  static String getMsgByErrorType(AppErrorType errorType) {
    switch (errorType) {
      case AppErrorType.network:
        return TranslationConsts.noNetwork;
      case AppErrorType.api:
      case AppErrorType.database:
        return TranslationConsts.somethingWrong;
      case AppErrorType.sessionDenied:
        return TranslationConsts.sessionDenied;
      default:
        return TranslationConsts.wrongUsernamePassword;
    }
  }

  @override
  List<Object> get props => [message, errorType];
}

enum AppErrorType { api, network, database, unauthorized, sessionDenied }
