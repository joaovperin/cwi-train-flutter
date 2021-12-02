List<List<T>> splitListInChunks<T>(List<T> list, int chunkSize) {
  if (list.length > chunkSize) {
    return List.generate(
      (list.length / chunkSize).ceil(),
      (index) => list.sublist(index * chunkSize, (index + 1) * chunkSize),
    );
  }
  return [list];
}
