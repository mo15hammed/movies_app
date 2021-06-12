import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/languages.dart';
import 'package:movies_app/domain/entities/language_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_preferred_language.dart';
import 'package:movies_app/domain/usecases/update_language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBloc({
    @required this.getPreferredLanguage,
    @required this.updateLanguage,
  }) : super(
          LanguageLoaded(
            Locale(getPreferredLanguage(NoParams()).getOrElse(() => Languages.languages[0].code)),
          ),
        );

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ChangeLanguageEvent) {
      updateLanguage(event.language.code);
      add(LoadPreferredLanguageEvent());
    } else if (event is LoadPreferredLanguageEvent) {
      final response = getPreferredLanguage(NoParams());
      yield response.fold(
        (l) => LanguageError(),
        (r) => LanguageLoaded(Locale(r)),
      );
    }
  }
}
