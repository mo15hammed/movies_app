import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/api_constants.dart';
import 'package:movies_app/common/constants/locale_keys.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/domain/entities/language_entity.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/widgets/logo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'navigation_expanded_list_item.dart';
import 'navigation_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
            offset: const Offset(-2.0, 0.0),
          ),
        ],
      ),
      width: Sizes.dimen_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.dimen_56.h,
                horizontal: Sizes.dimen_28.w,
              ),
              child: const Logo(),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    blurRadius: 2.0,
                    offset: const Offset(-2.0, 0.0),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationListItem(
                    title: LocaleKeys.favMovies.tr(),
                    onPressed: () {},
                  ),
                  NavigationExpandedListItem(
                    title: LocaleKeys.language.tr(),
                    onPressed: (index) async {
                      // context.read<LanguageBloc>().add(
                      //     ToggleLanguageEvent(LanguageEntity.languages[index]));
                      context.setLocale(LanguageEntity.locales[index]);
                    },
                    children: LanguageEntity.languages
                        .map((lang) => lang.value)
                        .toList(),
                  ),
                  NavigationListItem(
                    title: LocaleKeys.feedback.tr(),
                    onPressed: () {},
                  ),
                  NavigationListItem(
                    title: LocaleKeys.about.tr(),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
