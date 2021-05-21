import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constraints/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/data/core/api_constants.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title, posterPath;

  const MovieTabCardWidget({
    Key key,
    @required this.movieId,
    @required this.title,
    @required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL + posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_1.h),
            child: Text(
              title.intelliTrim(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
