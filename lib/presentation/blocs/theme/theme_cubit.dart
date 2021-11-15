import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  void toggleTheme() =>
      emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);

  @override
  ThemeMode fromJson(Map<String, dynamic> json) =>
      ThemeMode.values[json['theme']];

  @override
  Map<String, dynamic> toJson(ThemeMode state) => {'theme': state.index};
}
