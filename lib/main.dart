import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/data/tables/movie_table.dart';
import 'package:movies_app/presentation/movie_app.dart';
import 'package:pedantic/pedantic.dart';
import 'data/data_sources/authentication_local_data_source.dart';
import 'data/data_sources/language_local_data_source.dart';
import 'di/get_it.dart' as getIt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  await Hive.initFlutter();
  Hive.registerAdapter(MovieTableAdapter());
  await Future.wait([
    Hive.openBox(LANG_BOX),
    Hive.openBox(AUTH_BOX),
  ]);
  unawaited(getIt.init());

  runApp(MovieApp());
}
