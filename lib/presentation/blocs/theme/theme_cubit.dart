import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  void toggleTheme() =>
      emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    if (json['theme'] == null) return ThemeMode.dark;
    final theme =
        (json['theme'] as int) == 0 ? ThemeMode.dark : ThemeMode.light;
    return theme;
  }

  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    print(state.toString());
    if (state == ThemeMode.dark) {
      return {'theme': 0};
    }
    return {'theme': 1};
  }
}
