import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/route_constants.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movies_app/presentation/themes/theme_text.dart ';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        Navigator.of(context).pushNamed(
          RouteList.movieDetail,
          arguments: MovieDetailArgument(movie.id),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
        ),
        child: Container(
          height: Sizes.dimen_140.h,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.dimen_14.w),
                  child: CachedNetworkImage(
                    imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                    placeholder: (context, str) => Image.asset(
                      'assets/pngs/tmdb_logo.png',
                      fit: BoxFit.cover,
                    ),
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: Sizes.dimen_10.w),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
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
