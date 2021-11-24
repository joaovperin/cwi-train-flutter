import 'dart:convert';

class GithubUser {
  final int id;
  final String login;
  final String url;
  final String avatarUrl;

  const GithubUser(
    this.id,
    this.login,
    this.url,
    this.avatarUrl,
  );

  GithubUser copyWith({
    int? id,
    String? login,
    String? url,
    String? avatarUrl,
  }) {
    return GithubUser(
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

  factory GithubUser.fromMap(Map<String, dynamic> map) {
    return GithubUser(
      map['id'],
      map['login'],
      map['url'],
      map['avatar_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubUser.fromJson(String source) =>
      GithubUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, login: $login, url: $url, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GithubUser &&
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
