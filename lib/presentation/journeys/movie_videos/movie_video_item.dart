import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/video_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class MovieVideoItem extends StatelessWidget {
  final VideoEntity videoEntity;
  final String thumbnail;
  final Function() onTap;

  const MovieVideoItem({
    Key? key,
    required this.videoEntity,
    required this.thumbnail,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Sizes.dimen_120.h,
        // padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: thumbnail,
                placeholder: (_, __) => const SizedBox.expand(),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.dimen_8.w,
                  vertical: Sizes.dimen_8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoEntity.name ?? '',
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Text(
                      videoEntity.publishedAt?.split(' ')[0] ?? '',
                      style: Theme.of(context).textTheme.greyCaption,
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
