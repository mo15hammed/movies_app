import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/movie_listview_widget.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/movie_tabbed_constants.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/tab_title_widget.dart';
import 'package:movies_app/presentation/widgets/app_error_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key key}) : super(key: key);

  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc => BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  _onTapTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
    movieTabbedBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_10.h),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: MovieTabbedConstants.tabs
                    .map(
                      (t) => TabTitleWidget(
                        title: t.title,
                        onTap: () => _onTapTapped(t.index),
                        isSelected: t.index == state.currentTabIndex,
                      ),
                    )
                    .toList(),
              ),
              if (state is MovieTabLoading)
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (state is MovieTabChanged)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                    child: state.movies?.isEmpty ?? true
                        ? Center(
                            child: Text(
                              TranslationConsts.noMovies.t(context),
                              style: Theme.of(context).textTheme.subtitle1,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : MovieListviewWidget(
                            movies: state.movies,
                          ),
                  ),
                ),
              if (state is MovieTabLoadError)
                Expanded(
                  child: AppErrorWidget(
                    message: state.message,
                    errorType: state.errorType,
                    onRetryPressed: () => movieTabbedBloc.add(
                      MovieTabChangedEvent(currentTabIndex: state.currentTabIndex),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
