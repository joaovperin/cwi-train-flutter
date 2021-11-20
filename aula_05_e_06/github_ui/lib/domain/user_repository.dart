import 'package:dio/dio.dart';
import 'package:github_ui/domain/user_model.dart';

abstract class UserRepository {
  const UserRepository._();
  static const UserRepository instance = _UserRepositoryDioHttp();

  Future<List<UserModel>> findUsersByName(String name);
  // Future<List<UserModel>> findUsersByXName(int id);
}

class _UserRepositoryDioHttp implements UserRepository {
  const _UserRepositoryDioHttp();

  @override
  Future<List<UserModel>> findUsersByName(String name) async {
    if (name.isEmpty) {
      return [];
    }
    final search = name.replaceAll(' ', '%20');
    return _http
        .get('https://api.github.com/search/users?q=$search')
        .then((response) {
      final users = response.data['items'];
      return users.map<UserModel>((user) => UserModel.fromMap(user)).toList();
    });
  }

  Dio get _http {
    return Dio();
  }
}
