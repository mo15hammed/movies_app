import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/cast_entity.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class CastItemWidget extends StatelessWidget {
  final CastEntity castItem;

  const CastItemWidget({
    Key? key,
    required this.castItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_160.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.dimen_8.h),
        border: Border.all(width: Sizes.dimen_0),
      ),
      // clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: castItem.profilePath ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (_, x) {
                return Container();
              },
              errorWidget: (_, __, ___) => Container(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: Sizes.dimen_4.h,
              start: Sizes.dimen_4.w,
              end: Sizes.dimen_4.w,
            ),
            child: Text(
              castItem.name ?? '',
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: Theme.of(context).textTheme.vulcanBodyText2,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: Sizes.dimen_4.h,
              start: Sizes.dimen_4.w,
              end: Sizes.dimen_4.w,
            ),
            child: Text(
              castItem.character ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
