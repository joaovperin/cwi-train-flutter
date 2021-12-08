import 'package:cleandex_poketecture/commons/interfaces.dart';

abstract class AbstractHttpMapper<T> implements EntityMapper<T> {
  const AbstractHttpMapper();

  int parseIdFromUrl(String url) {
    final idStr = RegExp(r'.*\/.*?\/(\d+)\/?').firstMatch(url)?.group(1) ?? '0';
    return int.parse(idStr);
  }
}
