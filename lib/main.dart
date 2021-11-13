import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movies_app/domain/entities/language_entity.dart';
import 'package:movies_app/presentation/blocs/debug/app_bloc_observer.dart';
import 'package:movies_app/presentation/movie_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'di/get_it.dart' as get_it;
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  Bloc.observer = AppBlocObserver();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  get_it.init();

  runApp(
    EasyLocalization(
      supportedLocales: LanguageEntity.locales,
      path: 'assets/translations',
      fallbackLocale: Locale(LanguageEntity.languages[0].code),
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: () => const MovieApp(),
      ),
    ),
  );
}
