import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github_ui/domain/user/user.dart';
import 'package:github_ui/domain/user/user_repository.dart';
import 'package:github_ui/pages/user_details_page.dart';

class SearchUserPage extends StatefulWidget {
  static const String routeName = '/search-users';
  const SearchUserPage({Key? key}) : super(key: key);

  @override
  State<SearchUserPage> createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  final _searchCtrl = TextEditingController();
  Timer? _searchDebounce;

  List<GithubUser> _users = [];

  @override
  void initState() {
    super.initState();
    _searchCtrl.text = 'joaovperin';
    _searchUser();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  void _searchUser() {
    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      final search = _searchCtrl.text;
      UserRepository.instance.findUsersByName(search).then((value) {
        setState(() {
          _users = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _searchCtrl,
              onChanged: (value) => _searchUser(),
              decoration: InputDecoration(
                labelText: 'Search user',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchUser,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Results:', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _users.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return GestureDetector(
                    onTap: () {
                      UserRepository.instance.findUserInfo(user.login).then(
                          (value) => Navigator.pushNamed(
                              context, UserDetailsPage.routeName,
                              arguments:
                                  UserDetailsPageArgs(user, info: value)));
                    },
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(user.login),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatarUrl),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
