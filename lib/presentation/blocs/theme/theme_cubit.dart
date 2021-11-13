import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

enum Themes { light, dark }

class ThemeCubit extends Cubit<Themes> {
  ThemeCubit() : super(Themes.dark);

  void toggleTheme() => emit(state == Themes.dark ? Themes.light : Themes.dark);
}
