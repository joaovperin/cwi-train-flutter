import 'package:cleandex_poketecture/commons/interfaces.dart';

class Item implements Entity<Item> {
  @override
  final int id;
  final String name;
  final double cost;
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
    required this.cost,
    required this.description,
    required this.pictureUrl,
  });
}
