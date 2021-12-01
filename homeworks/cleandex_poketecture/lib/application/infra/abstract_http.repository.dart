abstract class AbstractHttpRepository<T> {
  static const apiUrl = 'https://pokeapi.co/api/v2';

  AbstractHttpRepository(this.entityUrl)
      : _regex = RegExp('.*\\/$entityUrl\\/(\\d+)\\/?');

  final String entityUrl;
  final RegExp _regex;

  static const maxResultCount = 300;

  T fromMap(Map<String, dynamic> map);

  String get url => '$apiUrl/$entityUrl';

  int parseIdFromUrl(String url) {
    final idStr = _regex.firstMatch(url)?.group(1) ?? '0';
    return int.parse(idStr);
  }

  String formatName(String name) {
    return name
        .split('-')
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .join(' ');
  }
}
