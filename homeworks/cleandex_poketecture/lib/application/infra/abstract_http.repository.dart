abstract class AbstractHttpRepository<T> {
  static const apiUrl = 'https://pokeapi.co/api/v2';

  AbstractHttpRepository(this.entityUrl);

  final String entityUrl;

  String get url => '$apiUrl/$entityUrl';
}
