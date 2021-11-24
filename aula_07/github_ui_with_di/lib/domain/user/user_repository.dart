import 'package:dio/dio.dart';
import 'package:github_ui/domain/user/user.dart';
import 'package:github_ui/domain/user/user_info.dart';

abstract class UserRepository {
  const UserRepository._();
  static const UserRepository instance = _UserRepositoryDioHttp();

  Future<List<GithubUser>> findUsersByName(String name);
  Future<GithubUserInfo> findUserInfo(String login);
}

class _UserRepositoryDioHttp implements UserRepository {
  const _UserRepositoryDioHttp();

  static const _apiUrl = 'https://api.github.com';

  @override
  Future<List<GithubUser>> findUsersByName(String name) async {
    if (name.isEmpty) {
      return [];
    }
    return _http.get('$_apiUrl/search/users?q=$name').then((response) {
      final users = response.data['items'];
      return users.map<GithubUser>((user) => GithubUser.fromMap(user)).toList();
    });
  }

  @override
  Future<GithubUserInfo> findUserInfo(String login) {
    return _http.get('$_apiUrl/users/$login').then((response) {
      return GithubUserInfo.fromMap(response.data);
    });
  }

  Dio get _http {
    return Dio();
  }
}
