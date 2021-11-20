import 'package:dio/dio.dart';
import 'package:github_ui/domain/user_model.dart';

abstract class UserRepository {
  const UserRepository._();
  static const UserRepository instance = _UserRepositoryDioHttp();

  Future<UserModel?> findUserByName(String name);
}

class _UserRepositoryDioHttp implements UserRepository {
  const _UserRepositoryDioHttp();

  @override
  Future<UserModel?> findUserByName(String name) async {
    final search = name.replaceAll(' ', '%20');
    final response = await _http.get(
      'https://api.github.com/search/users?q=$search',
    );
    final json = response.data;
    final jsonList = json['items'];
    if (jsonList.length > 0) {
      return UserModel.fromMap(jsonList[0]);
    }
    return null;
  }

  Dio get _http {
    return Dio();
  }
}
