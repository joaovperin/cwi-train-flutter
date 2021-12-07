abstract class AppBlocEvent<MODEL> {
  const AppBlocEvent();
}

class AppBlocSearchEvent<MODEL> extends AppBlocEvent<MODEL> {
  const AppBlocSearchEvent(this.search);
  final String search;
}

class AppBlocFetchFirstPageEvent<MODEL> extends AppBlocFetchPageEvent<MODEL> {
  AppBlocFetchFirstPageEvent() : super._(<MODEL>[]);
}

class AppBlocFetchPageEvent<MODEL> extends AppBlocEvent<MODEL> {
  final List<MODEL> currentList;
  const AppBlocFetchPageEvent._(this.currentList);

  const factory AppBlocFetchPageEvent.next(List<MODEL> currentList) =
      AppBlocFetchPageEvent._;
}
