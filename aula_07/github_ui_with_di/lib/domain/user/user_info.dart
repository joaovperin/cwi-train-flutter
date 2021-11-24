class GithubUserInfo {
  final int id;
  final String login;
  final String name;
  final String? company;
  final String? location;
  final String? email;
  final String? bio;
  final int followers;
  final int following;
  final DateTime createdAt;

  const GithubUserInfo({
    required this.id,
    required this.login,
    required this.name,
    this.company,
    this.location,
    this.email,
    this.bio,
    required this.followers,
    required this.following,
    required this.createdAt,
  });

  GithubUserInfo copyWith({
    int? id,
    String? login,
    String? name,
    String? company,
    String? location,
    String? email,
    String? bio,
    int? followers,
    int? following,
    DateTime? createdAt,
  }) {
    return GithubUserInfo(
      id: id ?? this.id,
      login: login ?? this.login,
      name: name ?? this.name,
      company: company ?? this.company,
      location: location ?? this.location,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'UserInfoModel(id: $id, login: $login, name: $name, company: $company, location: $location, email: $email, bio: $bio, followers: $followers, following: $following, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GithubUserInfo &&
        other.id == id &&
        other.login == login &&
        other.name == name &&
        other.company == company &&
        other.location == location &&
        other.email == email &&
        other.bio == bio &&
        other.followers == followers &&
        other.following == following &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        login.hashCode ^
        name.hashCode ^
        company.hashCode ^
        location.hashCode ^
        email.hashCode ^
        bio.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        createdAt.hashCode;
  }
}
