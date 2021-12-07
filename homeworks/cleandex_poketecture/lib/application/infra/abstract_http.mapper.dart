import 'package:cleandex_poketecture/commons/interfaces.dart';

abstract class AbstractHttpMapper<T> implements EntityMapper<T> {
  const AbstractHttpMapper();

  int parseIdFromUrl(String url) {
    final idStr = RegExp(r'.*\/.*?\/(\d+)\/?').firstMatch(url)?.group(1) ?? '0';
    return int.parse(idStr);
  }

  String formatName(String name) {
    return name.split('-').map((e) {
      if (e.length > 1) {
        return e[0].toUpperCase() + e.substring(1);
      }
      return e;
    }).join(' ');
  }
}
