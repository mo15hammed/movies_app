import 'package:bloc/bloc.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(true);

  void show() => emit(true);
  void hide() => emit(false);
}
