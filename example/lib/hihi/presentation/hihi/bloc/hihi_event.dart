part of 'hihi_bloc.dart';

  @immutable
  abstract class HihiEvent {}
  
  class HihiInitEvent extends HihiEvent {}
  
  class HihiLoadingEvent extends HihiEvent {}
  
  class HihiSuccessEvent extends HihiEvent {
    HihiSuccessEvent(this.state);
  
    final HihiSuccess state;
  }
  
  class HihiFailureEvent extends HihiEvent {
    HihiFailureEvent(this.error);
  
    final String error;
  }
  