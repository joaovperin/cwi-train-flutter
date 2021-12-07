abstract class AbstractHttpRepository<T> {
  static const apiUrl = 'https://pokeapi.co/api/v2';

  AbstractHttpRepository(this.entityUrl);

  final String entityUrl;

  String get baseUrl => apiUrl;
  String get url => '$baseUrl/$entityUrl';
}
