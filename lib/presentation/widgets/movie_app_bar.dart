import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/blocs/movie_search/movie_search_bloc.dart';
import 'package:movies_app/presentation/journeys/movie_search/custom_movie_search_delegate.dart';
import 'package:movies_app/presentation/widgets/logo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: SvgPicture.asset(
                'assets/svgs/menu.svg',
                height: Sizes.dimen_28,
                matchTextDirection: true,
                color: colorScheme.onBackground,
              ),
            ),
            const Expanded(
              child: Logo(
                height: Sizes.dimen_48,
              ),
            ),
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomMovieSearchDelegate(
                    bloc: context.read<MovieSearchBloc>(),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: colorScheme.onBackground,
                size: Sizes.dimen_28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
