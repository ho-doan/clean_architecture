part of 'hihi_bloc.dart';

@immutable
abstract class HihiState {}

class HihiInitial extends HihiState {}

class HihiLoading extends HihiState {}

class HihiFailure extends HihiState {
  HihiFailure(this.error);

  final String error;
}

class HihiSuccess extends HihiState {
  HihiSuccess({
    this.counter = 0,
  });
  final int counter;
}
