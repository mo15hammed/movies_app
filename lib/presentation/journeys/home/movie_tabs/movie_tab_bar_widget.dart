import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/blocs/movie_tabs/movie_tabs_bloc.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/movie_list_view_builder.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/tab.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/tab_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieTabBarWidget extends StatelessWidget {
  const MovieTabBarWidget({
    Key? key,
  }) : super(key: key);

  void _onTabTapped(BuildContext context, int index) {
    context
        .read<MovieTabsBloc>()
        .add(MovieTabChangedEvent(currentTabIndex: index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabsBloc, MovieTabsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: TabModel.movieTabs.map((tab) {
                  return TabItemWidget(
                    title: tab.title,
                    isSelected: state.currentTabIndex == tab.index,
                    onTap: () => _onTabTapped(context, tab.index),
                  );
                }).toList(),
              ),
              if (state is MovieTabLoadSuccess)
                Expanded(
                  child: MovieListViewBuilder(movies: state.movies),
                )
            ],
          ),
        );
      },
    );
  }
}
