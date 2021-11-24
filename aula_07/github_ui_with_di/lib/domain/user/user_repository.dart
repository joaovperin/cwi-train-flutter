import 'package:github_ui/domain/user/user.dart';
import 'package:github_ui/domain/user/user_info.dart';

abstract class UserRepository {
  const UserRepository._();

  Future<List<GithubUser>> findUsersByName(String name);
  Future<GithubUserInfo> findUserInfo(String login);
}
