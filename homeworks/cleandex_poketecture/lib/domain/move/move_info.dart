import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';

class MoveInfo {
  final int id;
  final String name;
  final NameUrlPair type;
  final String pictureUrl;
  final String description;
  final int power;
  final int accuracy;
  final int pp;

  const MoveInfo({
    required this.id,
    required this.name,
    required this.type,
    required this.pictureUrl,
    required this.description,
    required this.power,
    required this.accuracy,
    required this.pp,
  });
}
