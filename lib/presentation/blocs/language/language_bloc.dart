import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(LanguageEntity.locales[0])) {
    on<ToggleLanguageEvent>(onLanguageLoad);
  }

  void onLanguageLoad(ToggleLanguageEvent event, Emitter<LanguageState> emit) {
    emit(LanguageState(Locale(event.language.code)));
  }
}
