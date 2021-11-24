import 'dart:convert';

import 'package:github_ui/commons/abstractions/app_mapper.dart';
import 'package:github_ui/domain/user/user.dart';

class UserMapperImpl implements HttpMapper<GithubUser> {
  const UserMapperImpl();

  @override
  Map<String, dynamic> toMap(GithubUser entity) {
    return {
      'id': entity.id,
      'login': entity.login,
      'url': entity.url,
      'avatar_url': entity.avatarUrl,
    };
  }

  @override
  GithubUser fromMap(Map<String, dynamic> map) {
    return GithubUser(
      map['id'],
      map['login'],
      map['url'],
      map['avatar_url'] ?? '',
    );
  }

  @override
  String toJson(GithubUser entity) => json.encode(toMap(entity));

  @override
  GithubUser fromJson(String source) => fromMap(json.decode(source));
}
