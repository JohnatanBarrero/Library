import 'package:bloc/bloc.dart' as bloc;
import 'package:library_roobin/models/doc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:library_roobin/pages/dashboard/repository.dart';

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
    } else if (event is LoadBooksEvent) {
      yield* _loadBooksEvent(event);
    } else if (event is ChooseTypeSearchEvent) {
      yield* _chooseTypeSearchEvent(event);
    } else if (event is AddFavoriteBookEvent) {
      yield* _addFavoriteBookEvent(event);
    }
  }

  Stream<State> _addFavoriteBookEvent(AddFavoriteBookEvent event) async* {
  
    List<Doc> listfavorite = [...state.model.docsfavorites];
    listfavorite.add(event.newbook);
    yield AadedBooksState(
      state.model.copyWith(
        docsfavorites: listfavorite,
        typesearch: 3
      ),
    );
  }

  Stream<State> _chooseTypeSearchEvent(ChooseTypeSearchEvent event) async* {
    yield ChoosingState(state.model);

    yield ChoosedState(
      state.model.copyWith(
        typesearch: event.typesearch,
      ),
    );
  }

  Stream<State> _loadBooksEvent(LoadBooksEvent event) async* {
    yield LoadingState(state.model);
    try {
      if (state.model.typesearch == 1) {
        yield LoadedBooksState(
          state.model.copyWith(
              typesearch: state.model.typesearch,
              docs: await repository.getBooksTittle(event.name)),
        );
      } else {
        yield LoadedBooksState(
          state.model.copyWith(
              typesearch: state.model.typesearch,
              docs: await repository.getBooksAuthor(event.name)),
        );
      }
    } catch (e) {
      yield ErrorState(state.model);
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
