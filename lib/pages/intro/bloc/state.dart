part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class LoadingState extends State {
  const LoadingState(Model model) : super(model);
}

class LoadedState extends State {
  const LoadedState(Model model) : super(model);
}

class ErrorState extends State {
  const ErrorState(Model model) : super(model);
}

class Model extends Equatable {
  final bool setup;

  const Model({this.setup = false});

  Model copyWith({required bool setup}) => Model(
        setup: setup,
      );

  Model clear() => const Model(setup: false);

  @override
  List<Object> get props => [setup];
}
