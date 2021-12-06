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
class ChoosingState extends State {
  const ChoosingState(Model model) : super(model);
}

class ChoosedState extends State {
  const ChoosedState(Model model) : super(model);
}

class LoadedBooksState extends State {
  const LoadedBooksState(Model model) : super(model);
}
class AadedBooksState extends State {
  const AadedBooksState(Model model) : super(model);
}

class ErrorState extends State {
  const ErrorState(Model model) : super(model);
}

class Model extends Equatable {
  final bool setup;
  final String? namebook;
  final String? author;
  final List<Doc> docs;
  final int typesearch;
  final List<Doc> docsfavorites;

  const Model(
      {this.setup = false,
      this.namebook,
      this.author,
      this.docs = const [],
      this.docsfavorites = const [],
      this.typesearch = 1});

  Model copyWith({
    bool setup = false,
    String? namebook,
    String? author,
    List<Doc>? docs,
      List<Doc>? docsfavorites,
    int typesearch = 1,
  }) =>
      Model(
        setup: setup,
        namebook: namebook ?? this.namebook,
        author: author ?? this.author,
        docs: docs ?? this.docs,
         docsfavorites: docsfavorites ?? this.docsfavorites,
        typesearch: typesearch,
      );

  @override
  List<Object?> get props => [setup, namebook, author, docs,docsfavorites, typesearch];
}
