class TabModel {
  final int index;
  final String title;

  const TabModel({
    required this.index,
    required this.title,
  }) : assert(index >= 0, 'index must be greater than 0');

  static const List<TabModel> movieTabs = [
    TabModel(index: 0, title: 'Popular'),
    TabModel(index: 1, title: 'Now'),
    TabModel(index: 2, title: 'Soon'),
  ];
}
