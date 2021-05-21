import 'package:movies_app/domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(
      code: 'en',
      value: 'English',
    ),
    LanguageEntity(
      code: 'ar',
      value: 'العربية',
    ),
    LanguageEntity(
      code: 'es',
      value: 'Español',
    ),
  ];
}
