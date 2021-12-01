import 'package:cleandex_poketecture/domain/item/item.dart';

abstract class ItemRepository {
  const ItemRepository._();

  Future<List<Item>> findAll();
  Future<Item?> findById(int id);
}
