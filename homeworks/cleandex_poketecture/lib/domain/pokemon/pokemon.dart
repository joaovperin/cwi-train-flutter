class Pokemon {
  final int id;
  final String name;
  final String pictureUrl;

  String get fmtId {
    return '#${id.toString().padLeft(3, "0")}';
  }

  Pokemon({
    required this.id,
    required this.name,
    required this.pictureUrl,
  });
}
