import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/languages.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/presentation/app_localization.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/widgets/app_dialog.dart';
import 'package:movies_app/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4.0,
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      constraints: BoxConstraints(
        maxWidth: Sizes.dimen_400,
      ),
      child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: Sizes.dimen_14.h,
                    bottom: Sizes.dimen_14.h,
                    start: Sizes.dimen_8.w,
                    end: Sizes.dimen_8.w,
                  ),
                  child: Logo(
                    height: Sizes.dimen_10.h,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      blurRadius: 4.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    NavigationListItem(
                      title: TranslationConsts.favMovies.t(context),
                      onPressed: () {},
                    ),
                    NavigationExpandedListItem(
                      title: TranslationConsts.language.t(context),
                      onPressed: (index) {
                        BlocProvider.of<LanguageBloc>(context)
                            .add(ChangeLanguageEvent(Languages.languages[index]));
                      },
                      children: Languages.languages.map((e) => e.value).toList(),
                    ),
                    NavigationListItem(
                      title: TranslationConsts.feedback.t(context),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Wiredash.of(context).show();
                      },
                    ),
                    NavigationListItem(
                      title: TranslationConsts.about.t(context),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _showDialog(context);
                      },
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

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AppDialog(
          title: TranslationConsts.about.t(context),
          desc: TranslationConsts.aboutDesc.t(context),
          buttonText: TranslationConsts.okay.t(context),
          image: Image.asset(
            'assets/pngs/tmdb_logo.png',
            height: Sizes.dimen_32.h,
          ),
        );
      },
    );
  }
}
