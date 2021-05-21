import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/tab.dart';

class MovieTabbedConstants {
  static const List<Tab> tabs = [
    const Tab(index: 0, title: TranslationConsts.popular),
    const Tab(index: 1, title: TranslationConsts.now),
    const Tab(index: 2, title: TranslationConsts.soon),
  ];
}