import 'package:flutter/material.dart';

class LanguageEntity {
  final String code;
  final String value;

  const LanguageEntity({
    required this.code,
    required this.value,
  });

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'ar', value: 'العربية'),
  ];

  static get locales => languages.map((lang) => Locale(lang.code)).toList();
}
