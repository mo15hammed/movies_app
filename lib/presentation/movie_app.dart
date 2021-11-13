import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/journeys/loading/loading_screen.dart';
import 'package:movies_app/presentation/routing/app_router.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/presentation/wiredash_app.dart';

import 'blocs/loading/loading_cubit.dart';
import 'blocs/theme/theme_cubit.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingCubit>(
          create: (context) => getItInstance(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: WiredashApp(
        navigatorKey: _navigatorKey,
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            primaryColor: AppColors.vulcan,
            unselectedWidgetColor: AppColors.royalBlue,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColors.royalBlue,
              secondary: AppColors.violet,
            ),
            scaffoldBackgroundColor: AppColors.vulcan,
            textTheme: ThemeText.textTheme,
            appBarTheme: const AppBarTheme(
              elevation: 0.0,
              color: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
            ),
          ),
          // initialRoute: AppRouter.initial,
          builder: (context, child) {
            return LoadingScreen(screen: child);
          },
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
