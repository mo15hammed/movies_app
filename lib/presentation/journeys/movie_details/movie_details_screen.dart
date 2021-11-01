import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_arguments.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'big_poster_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieDetailsArguments args;

  const MovieDetailsScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getItInstance<MovieDetailsBloc>()
          ..add(MovieDetailsLoadEvent(args.id)),
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsSuccess) {
              final movie = state.movie;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    BigPosterWidget(
                      movie: movie,
                    ),
                    Padding(
                      padding: EdgeInsets.all(Sizes.dimen_16.w),
                      child: Text(
                        movie.overview ?? '',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailsError) {
              return Container();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
