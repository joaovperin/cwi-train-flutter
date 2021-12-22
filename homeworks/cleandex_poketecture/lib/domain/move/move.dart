import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';

class Move implements Entity<Move> {
  @override
  final int id;
  final String name;
  final String slug;
  final NameUrlPair type;
  final String picturePath;
  final String description;
  final int power;
  final int accuracy;
  final int pp;

  const Move({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
    required this.picturePath,
    required this.description,
    required this.power,
    required this.accuracy,
    required this.pp,
  });
}
