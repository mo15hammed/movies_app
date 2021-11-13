import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<StartLoadingEvent>(_onStartLoading);
    on<FinishLoadingEvent>(_onFinishLoading);
  }

  void _onStartLoading(StartLoadingEvent event, Emitter emit) {
    emit(LoadingStarted());
  }

  void _onFinishLoading(FinishLoadingEvent event, Emitter emit) {
    emit(LoadingFinished());
  }
}
