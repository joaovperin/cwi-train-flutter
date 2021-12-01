class Pokemon {
  final int id;
  final String name;
  final String avatarUrl;

  String get fmtId {
    return '#${id.toString().padLeft(3, "0")}';
  }

  const Pokemon({
    required this.id,
    required this.name,
    required this.avatarUrl,
  });
}
