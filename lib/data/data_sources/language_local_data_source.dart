import 'package:hive/hive.dart';

abstract class LanguageLocalDataSource {
  final String langKey = 'preferred_language';
  final String langBoxName = 'languageBox';
  Future<void> updateLanguage(String language);
  Future<String> getPreferredLanguage();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  @override
  Future<String> getPreferredLanguage() async {
    final langBox = await Hive.openBox(langBoxName);
    return langBox.get(langKey);
  }

  @override
  Future<void> updateLanguage(String langCode) async {
    final langBox = await Hive.openBox(langBoxName);
    langBox.put(langKey, langCode);
  }

}