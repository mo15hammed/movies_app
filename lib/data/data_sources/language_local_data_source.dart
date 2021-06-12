import 'package:hive/hive.dart';

const String LANG_BOX = 'languageBox';
const String LANG_KEY = 'preferred_language';

abstract class LanguageLocalDataSource {
  void updateLanguage(String language);
  String getPreferredLanguage();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  @override
  String getPreferredLanguage() {
    final langBox = Hive.box(LANG_BOX);
    return langBox.get(LANG_KEY);
  }

  @override
  void updateLanguage(String langCode) {
    final langBox = Hive.box(LANG_BOX);
    langBox.put(LANG_KEY, langCode);
  }

}