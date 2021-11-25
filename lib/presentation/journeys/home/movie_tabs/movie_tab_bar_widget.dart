import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/blocs/movie_tabs/movie_tabs_cubit.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/app_error_widget.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/movie_list_view_builder.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/tab_entity.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/tab_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/presentation/journeys/loading/loading_widget.dart';

class MovieTabBarWidget extends StatelessWidget {
  const MovieTabBarWidget({
    Key? key,
  }) : super(key: key);

  void _onTabTapped(BuildContext context, int index) {
    context.read<MovieTabsCubit>().changeMovieTab(index: index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabsCubit, MovieTabsState>(
      builder: (context, state) {
        return Padding(
          key: ValueKey('${context.locale}'),
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: TabEntity.movieTabs.map((tab) {
                  return TabItemWidget(
                    title: tab.title.tr(),
                    isSelected: state.currentTabIndex == tab.index,
                    onTap: () => _onTabTapped(context, tab.index),
                  );
                }).toList(),
              ),
              if (state is MovieTabLoading)
                Expanded(
                  child: LoadingWidget(size: Sizes.dimen_200.w),
                ),
              if (state is MovieTabLoadSuccess)
                Expanded(
                  child: MovieListViewBuilder(movies: state.movies),
                ),
              if (state is MovieTabLoadError)
                AppErrorWidget(
                  message: state.message,
                  errorType: state.errorType,
                  onRetryPressed: () {
                    context
                        .read<MovieTabsCubit>()
                        .changeMovieTab(index: state.currentTabIndex);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
