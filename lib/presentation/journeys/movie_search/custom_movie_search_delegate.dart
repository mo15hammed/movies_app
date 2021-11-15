import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/locale_keys.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/blocs/movie_search/movie_search_bloc.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/app_error_widget.dart';
import 'package:movies_app/presentation/journeys/loading/loading_widget.dart';
import 'package:movies_app/presentation/themes/app_theme.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'movie_search_card_item.dart';

class CustomMovieSearchDelegate extends SearchDelegate {
  final MovieSearchBloc bloc;

  CustomMovieSearchDelegate({
    required this.bloc,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: query.isEmpty ? null : () => query = '',
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppTheme.royalBlue,
          size: Sizes.dimen_28.sp,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: Sizes.dimen_28.sp,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      bloc.add(SearchQueryChangedEvent(query));
    }

    return BlocBuilder<MovieSearchBloc, MovieSearchState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is MovieSearchLoadError) {
          return AppErrorWidget(
            message: state.message,
            errorType: state.errorType,
            onRetryPressed: () {
              query = state.query;
              bloc.add(SearchQueryChangedEvent(query));
            },
          );
        }
        if (state is MovieSearchLoadSuccess) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(Sizes.dimen_60),
                child: Text(
                  LocaleKeys.noSearchMovies.tr(),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(Sizes.dimen_16),
            itemBuilder: (_, i) {
              return MovieSearchCardItem(movie: movies[i]);
            },
            separatorBuilder: (_, i) {
              return const SizedBox(height: Sizes.dimen_8);
            },
            itemCount: movies.length,
          );
        }
        return LoadingWidget(size: Sizes.dimen_200.w);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
