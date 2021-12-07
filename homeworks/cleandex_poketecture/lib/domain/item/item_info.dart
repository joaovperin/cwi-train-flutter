class ItemInfo {
  final int id;
  final String name;
  final String description;
  final String pictureUrl;

  String get fmtId {
    return id.toString().padLeft(3, '0');
  }

  const ItemInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureUrl,
  });
}
