import 'package:movies_app/common/constants/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class TabEntity {
  final int index;
  final String title;

  const TabEntity({
    required this.index,
    required this.title,
  }) : assert(index >= 0, 'index must be greater than 0');

  static const List<TabEntity> movieTabs = [
    TabEntity(index: 0, title: LocaleKeys.popular),
    TabEntity(index: 1, title: LocaleKeys.now),
    TabEntity(index: 2, title: LocaleKeys.soon),
  ];
}
