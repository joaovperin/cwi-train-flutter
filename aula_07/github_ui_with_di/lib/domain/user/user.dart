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
