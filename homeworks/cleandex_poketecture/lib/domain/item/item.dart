import 'package:cleandex_poketecture/commons/interfaces.dart';

class Item implements Entity<Item> {
  @override
  final int id;
  final String name;
  final String slug;
  final num cost;
  final String description;
  final String pictureUrl;

  String get fmtId {
    return id.toString().padLeft(3, '0');
  }

  String get fmtCost {
    return '$cost ¥';
  }

  const Item({
    required this.id,
    required this.name,
    required this.slug,
    required this.cost,
    required this.description,
    required this.pictureUrl,
  });
}
