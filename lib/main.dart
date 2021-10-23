import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/debug/app_bloc_observer.dart';
import 'package:movies_app/presentation/movie_app.dart';
import 'di/get_it.dart' as get_it;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = AppBlocObserver();
  get_it.init();

  runApp(const MovieApp());
}

