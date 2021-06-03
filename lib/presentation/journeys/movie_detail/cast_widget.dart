import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoadSuccess) {
          print(state.cast.length);
          return Container(
            height: Sizes.dimen_120.h,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.cast.length,
              itemBuilder: (context, index) {
                final castMember = state.cast[index];
                print(castMember.posterPath);
                return Container(
                  // height: Sizes.dimen_120.h,
                  width: Sizes.dimen_64.w,
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    margin: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_2.w,
                      vertical: Sizes.dimen_4.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl: '${ApiConstants.BASE_IMAGE_URL + castMember.posterPath ?? ''}',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_3.w),
                          child: Text(
                            castMember.name,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.vulcanBodyText2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: Sizes.dimen_3.w,
                            end : Sizes.dimen_3.w,
                            bottom: Sizes.dimen_2.h,
                          ),
                          child: Text(
                            castMember.character,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else
          return const SizedBox.shrink();
      },
    );
  }
}
