import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_screen.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class MovieSearchCardItem extends StatelessWidget {
  final MovieEntity movie;

  const MovieSearchCardItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movieId: movie.id),
          ),
        );
      },
      child: SizedBox(
        height: Sizes.dimen_140.h,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_8.r),
                child: CachedNetworkImage(
                  imageUrl: movie.posterPath ,
                  placeholder: (_, __) => const SizedBox.shrink(),
                  errorWidget: (_, __, ___) => const SizedBox.shrink(),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(width: Sizes.dimen_10.w),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1),
                    Expanded(
                      child: Text(
                        movie.overview ?? '',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.greyCaption,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
