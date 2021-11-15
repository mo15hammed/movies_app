import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/routing/app_router.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_16.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      child: Material(
        color: Colors.transparent,
        elevation: Sizes.dimen_32,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRouter.details,
              arguments: movieId,
            );
          },
          child: CachedNetworkImage(
            imageUrl: posterPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
