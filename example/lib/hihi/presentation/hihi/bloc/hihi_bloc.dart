import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_case/hihi_use_case.dart';

part 'hihi_event.dart';
part 'hihi_state.dart';

class HihiBloc extends Bloc<HihiEvent, HihiState> {
  HihiBloc(this._useCase) : super(HihiInitial()) {
    on<HihiLoadingEvent>(
      (event, emit) => emit(HihiLoading()),
    );
    on<HihiFailureEvent>(
      (event, emit) => emit(HihiFailure(event.error)),
    );
    on<HihiSuccessEvent>(
      (event, emit) => emit(event.state),
    );
    on<HihiInitEvent>((event, emit) async {
      try {
        //   final result = await _useCase.getXXX();
        //   final model = result.fold(
        //     (l) => throw Exception(l),
        //     (r) => r,
        //   );
        emit(HihiSuccess());
      } catch (e) {
        emit(HihiFailure(e.toString()));
      }
    });
  }

  // ignore: unused_field
  final HihiUseCase _useCase;
}
