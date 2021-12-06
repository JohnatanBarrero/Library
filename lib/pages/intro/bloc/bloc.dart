import 'package:bloc/bloc.dart' as bloc;
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:library_roobin/pages/intro/repository.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  final Repository repository;
  Bloc([Repository? repository])
      : repository = repository ??= Repository(),
        super(initialState);
  static State get initialState => const InitialState(
        Model(),
      );
  @override
  Stream<State> mapEventToState(event) async* {
    if (event is LoadStatusEvent) {
      yield* _loadStatusEvent(event);
    }
  }

  Stream<State> _loadStatusEvent(LoadStatusEvent event) async* {
    yield LoadingState(state.model);
    try {
      await repository.setup();
      yield LoadedState(state.model);
    } catch (e) {
      yield ErrorState(state.model);
    }
  }
}
