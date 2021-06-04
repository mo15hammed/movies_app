import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movies_app/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:movies_app/presentation/themes/theme_text.dart ';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;
  const SearchMovieCard({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              args: MovieDetailArgument(movie.id),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_6.w,
          // vertical: Sizes.dimen_2.h,
        ),
        child: Container(
          height: Sizes.dimen_48.h,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                  child: CachedNetworkImage(
                    imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                    placeholder: (context, str) => Image.asset(
                      'assets/pngs/tmdb_logo.png',
                      fit: BoxFit.cover,
                    ),
                    height: Sizes.dimen_48.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: Sizes.dimen_4.w),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      // overflow: TextOverflow.fade,
                      // maxLines: 1,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Expanded(
                      child: Text(
                        movie.overview,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.greySubtitle1,
                        maxLines: movie.title.length > 20 ? 3 : 4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
