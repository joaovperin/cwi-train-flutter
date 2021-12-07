abstract class AppBlocState<MODEL> {
  const AppBlocState();
}

class AppBlocListState<MODEL> extends AppBlocState<MODEL> {
  final List<MODEL> list;
  final bool noMoreResults;

  const AppBlocListState._(this.list, {this.noMoreResults = false});

  factory AppBlocListState.empty() => const AppBlocListState._([]);

  const factory AppBlocListState.next(
    List<MODEL> list, {
    bool noMoreResults,
  }) = AppBlocListState._;
}

class AppBlocLoadingState<MODEL> extends AppBlocState<MODEL> {
  const AppBlocLoadingState();
}

class AppBlocFailState<MODEL> extends AppBlocState<MODEL> {
  const AppBlocFailState(this.message);

  final String message;
}
