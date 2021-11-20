import 'package:dio/dio.dart';
import 'package:dogs_list/domain/dog.dart';

abstract class DogRepository {
  const DogRepository._();
  static const DogRepository instance = _DogRepositoryDioHttp();

  Future<DogModel> getRandomDog();
}

class _DogRepositoryDioHttp implements DogRepository {
  const _DogRepositoryDioHttp();

  @override
  Future<DogModel> getRandomDog() async {
    final response = await _http.get('https://dog.ceo/api/breeds/image/random');
    final json = response.data;
    final imgUrl = json['message'];
    return DogModel(_extractBreedNameFromImageUrl(imgUrl), image: imgUrl);
  }

  String _extractBreedNameFromImageUrl(String imgUrl) {
    final breedName = imgUrl.split('/')[4];
    return breedName
        .split('-')
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .join(' ');
  }

  Dio get _http {
    return Dio();
  }
}
