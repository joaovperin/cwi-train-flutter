import 'dart:async';

import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';

class Pokemon {
  final int id;
  final String name;
  final String pictureUrl;
  final StreamController<PokemonInfo?> _info = StreamController.broadcast();

  String get fmtId {
    return '#${id.toString().padLeft(3, "0")}';
  }

  Stream<PokemonInfo?> get info => _info.stream;
  set info(Stream<PokemonInfo?> value) {
    value.listen((event) {
      if (event != null) _info.add(event);
    });
  }

  Pokemon({
    required this.id,
    required this.name,
    required this.pictureUrl,
  });
}
