part of 'bloc.dart';

@immutable
abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadStatusEvent extends Event {
  LoadStatusEvent();
}

class LoadBooksEvent extends Event {
  final String name;
  LoadBooksEvent(this.name);
}
class ChooseTypeSearchEvent extends Event {
  final int typesearch;
  ChooseTypeSearchEvent(this.typesearch);
}
class AddFavoriteBookEvent extends Event {
  final Doc newbook;
  AddFavoriteBookEvent(this.newbook);
}
