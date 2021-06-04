import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/presentation/blocs/search/search_bloc.dart';
import 'package:movies_app/presentation/journeys/search/search_movie_card.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart ';
import 'package:movies_app/presentation/widgets/app_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchBloc searchBloc;

  CustomSearchDelegate(this.searchBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
          size: Sizes.dimen_12.h,
        ),
        onPressed: query.isEmpty
            ? null
            : () {
                query = '';
              },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc?.add(LoadSearchMoviesEvent(query));

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is SearchError) {
          return AppErrorWidget(
            errorType: state.errorType,
            onRetryPressed: () => searchBloc?.add(LoadSearchMoviesEvent(query)),
          );
        } else if (state is SearchSuccess) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_6.w),
                child: Text(
                  TranslationConsts.noSearchMovies.t(context),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
            itemCount: state.movies.length,
            separatorBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_6.w,
                vertical: Sizes.dimen_4.h,
              ),
              height: 1,
              color: Colors.grey[800],
            ),
            itemBuilder: (context, index) => SearchMovieCard(movie: state.movies[index]),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
      ),
    );
  }
}
