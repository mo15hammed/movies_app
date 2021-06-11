import 'package:flutter/material.dart';

class LoginParams {
  final String username, password;

  LoginParams({
    @required this.username,
    @required this.password,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
