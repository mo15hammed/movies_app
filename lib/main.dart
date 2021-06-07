import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/data/tables/movie_table.dart';
import 'package:movies_app/presentation/movie_app.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  await Hive.initFlutter();
  Hive.registerAdapter(MovieTableAdapter());
  unawaited(getIt.init());
  runApp(MovieApp());
}
