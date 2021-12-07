import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/move/move_details.dart';

class MoveDetailsHttpMapper extends AbstractHttpMapper<MoveDetails> {
  const MoveDetailsHttpMapper() : super();

  @override
  Map<String, dynamic> toMap(MoveDetails entity) {
    return {
      'id': entity.id,
      'name': entity.name,
    };
  }

  @override
  MoveDetails fromMap(Map<String, dynamic> map) {
    return MoveDetails(
      id: map['id'],
      name: map['name'],
    );
  }
}
