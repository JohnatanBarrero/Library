part of 'bloc.dart';

@immutable
abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadStatusEvent extends Event {
  LoadStatusEvent();
}
