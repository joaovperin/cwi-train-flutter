import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:github_ui/commons/abstractions/app_mapper.dart';
import 'package:github_ui/domain/user/user.dart';
import 'package:github_ui/domain/user/user_info.dart';
import 'package:github_ui/domain/user/user_repository.dart';

class UserRepositoryDioHttp implements UserRepository {
  const UserRepositoryDioHttp();

  static const _apiUrl = 'https://api.github.com';

  @override
  Future<List<GithubUser>> findUsersByName(String name) async {
    if (name.isEmpty) {
      return [];
    }
    return _http.get('$_apiUrl/search/users?q=$name').then((response) {
      final users = response.data['items'];
      return users
          .map<GithubUser>((user) => _userMapper.fromMap(user))
          .toList();
    });
  }

  @override
  Future<GithubUserInfo> findUserInfo(String login) {
    return _http.get('$_apiUrl/users/$login').then((response) {
      return _userInfoMapper.fromMap(response.data);
    });
  }

  HttpMapper<GithubUser> get _userMapper =>
      GetIt.I.get<HttpMapper<GithubUser>>();

  HttpMapper<GithubUserInfo> get _userInfoMapper =>
      GetIt.I.get<HttpMapper<GithubUserInfo>>();

  Dio get _http => Dio();
}
