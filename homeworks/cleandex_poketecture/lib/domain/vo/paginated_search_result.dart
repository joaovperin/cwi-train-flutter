class PaginatedSearchResult<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  const PaginatedSearchResult({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  bool get isLastPage => results.isEmpty || next == null;
}
