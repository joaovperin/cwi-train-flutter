import 'dart:convert';

import 'package:github_ui/commons/abstractions/app_mapper.dart';
import 'package:github_ui/domain/user/user_info.dart';

class UserInfoMapperImpl implements HttpMapper<GithubUserInfo> {
  const UserInfoMapperImpl();

  @override
  Map<String, dynamic> toMap(GithubUserInfo entity) {
    return {
      'id': entity.id,
      'login': entity.login,
      'name': entity.name,
      'company': entity.company,
      'location': entity.location,
      'email': entity.email,
      'bio': entity.bio,
      'followers': entity.followers,
      'following': entity.following,
      'created_at': entity.createdAt.toIso8601String(),
    };
  }

  @override
  GithubUserInfo fromMap(Map<String, dynamic> map) {
    return GithubUserInfo(
      id: map['id'],
      login: map['login'],
      name: map['name'],
      company: map['company'],
      location: map['location'],
      email: map['email'],
      bio: map['bio'],
      followers: map['followers'],
      following: map['following'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  @override
  String toJson(GithubUserInfo entity) => json.encode(toMap(entity));

  @override
  GithubUserInfo fromJson(String source) => fromMap(json.decode(source));
}
