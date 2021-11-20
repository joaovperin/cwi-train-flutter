import 'dart:convert';

class UserModel {
  final int id;
  final String login;
  final String url;
  final String avatarUrl;

  const UserModel(
    this.id,
    this.login,
    this.url,
    this.avatarUrl,
  );

  UserModel copyWith({
    int? id,
    String? login,
    String? url,
    String? avatarUrl,
  }) {
    return UserModel(
      id ?? this.id,
      login ?? this.login,
      url ?? this.url,
      avatarUrl ?? this.avatarUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'url': url,
      'avatar_url': avatarUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'],
      map['login'],
      map['url'],
      map['avatar_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, login: $login, url: $url, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.login == login &&
        other.url == url &&
        other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ login.hashCode ^ url.hashCode ^ avatarUrl.hashCode;
  }
}
