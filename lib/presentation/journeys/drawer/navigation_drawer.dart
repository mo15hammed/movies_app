import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/languages.dart';
import 'package:movies_app/common/constants/route_constants.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/blocs/login/login_bloc.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movies_app/presentation/widgets/app_dialog.dart';
import 'package:movies_app/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width: 0.8.sw,
      height: 1.sh,
      constraints: BoxConstraints(
        maxWidth: Sizes.dimen_400,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: Sizes.dimen_36.h,
                    bottom: Sizes.dimen_14.h,
                    start: Sizes.dimen_14.w,
                    end: Sizes.dimen_14.w,
                  ),
                  child: Logo(
                    height: Sizes.dimen_80,
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
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteList.favorite);
                      },
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
                    BlocListener<LoginBloc, LoginState>(
                      listenWhen: (previous, current) => current is LogoutSuccess,
                      listener: (context, state) {
                        if (state is LogoutSuccess) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteList.initial,
                            (route) => false,
                          );
                        }
                      },
                      child: NavigationListItem(
                        title: TranslationConsts.logout.t(context),
                        onPressed: () {
                          Navigator.of(context).pop();
                          BlocProvider.of<LoginBloc>(context).add(LogoutUserEvent());
                        },
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
            height: Sizes.dimen_80.h,
          ),
        );
      },
    );
  }
}
