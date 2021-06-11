import 'package:equatable/equatable.dart';

class RequestTokenModel extends Equatable {
  final bool success;
  final String expiresAt;
  final String requestToken;

  const RequestTokenModel({
    this.success,
    this.expiresAt,
    this.requestToken,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) {
    return RequestTokenModel(
      success: json['success'],
      expiresAt: json['expires_at'],
      requestToken: json['request_token'],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'expires_at': expiresAt,
    'request_token': requestToken,
  };

  @override
  List<Object> get props => [success, expiresAt, requestToken];
}
