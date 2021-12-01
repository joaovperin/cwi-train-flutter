import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';

class MoveHttpMapper extends AbstractHttpMapper<Move> {
  const MoveHttpMapper() : super();

  @override
  Map<String, dynamic> toMap(Move entity) {
    return {
      'id': entity.id,
      'name': entity.name,
    };
  }

  @override
  Move fromMap(Map<String, dynamic> map) {
    return Move(
      id: parseIdFromUrl(map['url']),
      name: formatName(map['name']),
    );
  }
}
