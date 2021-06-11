import 'package:hive/hive.dart';

const String LANG_BOX = 'languageBox';
const String LANG_KEY = 'preferred_language';

abstract class LanguageLocalDataSource {
  Future<void> updateLanguage(String language);
  Future<String> getPreferredLanguage();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  @override
  Future<String> getPreferredLanguage() async {
    final langBox = await Hive.openBox(LANG_BOX);
    return langBox.get(LANG_KEY);
  }

  @override
  Future<void> updateLanguage(String langCode) async {
    final langBox = await Hive.openBox(LANG_BOX);
    langBox.put(LANG_KEY, langCode);
  }

}