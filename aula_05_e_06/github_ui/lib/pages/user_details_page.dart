import 'package:flutter/material.dart';
import 'package:github_ui/domain/user/user.dart';
import 'package:github_ui/domain/user/user_info.dart';

class UserDetailsPageArgs {
  final GithubUser user;
  final GithubUserInfo info;

  const UserDetailsPageArgs(this.user, {required this.info});
}

class UserDetailsPage extends StatefulWidget {
  static const String routeName = '/user-info';
  const UserDetailsPage(
    this.args, {
    Key? key,
  }) : super(key: key);

  final UserDetailsPageArgs args;

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final user = widget.args.user, info = widget.args.info;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Login: ${user.login}'),
            Text('Name: ${info.name}'),
            Text('Bio: ${info.bio}'),
            Text('Company: ${info.company}'),
            Text('Location: ${info.location}'),
            Text('Email: ${info.email}'),
            Text('Followers: ${info.followers}'),
            Text('Following: ${info.following}'),
            Text('CreatedAt: ${info.createdAt}'),
          ],
        ),
      ),
    );
  }
}
