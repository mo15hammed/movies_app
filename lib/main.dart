import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/language_entity.dart';
import 'package:movies_app/presentation/blocs/debug/app_bloc_observer.dart';
import 'package:movies_app/presentation/movie_app.dart';
import 'di/get_it.dart' as get_it;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = AppBlocObserver();
  await EasyLocalization.ensureInitialized();
  get_it.init();

  runApp(
    EasyLocalization(
      supportedLocales: LanguageEntity.locales,
      path: 'assets/translations',
      fallbackLocale: Locale(LanguageEntity.languages[0].code),
      // startLocale: const Locale('ar'),
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: () => const MovieApp(),
      ),
    ),
  );
}
