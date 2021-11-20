import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github_ui/domain/user_repository.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({Key? key}) : super(key: key);

  @override
  State<SearchUserPage> createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  final _searchCtrl = TextEditingController();
  Timer? _searchDebounce;
  String _text = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  void _searchUser() {
    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      final search = _searchCtrl.text;
      UserRepository.instance.findUserByName(search).then((value) {
        setState(() {
          if (value != null) {
            _text = '#${value.id} - ${value.login}';
          } else {
            _text = 'USER NOT FOUND';
          }
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
            Text('Results:', style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 20),
            Text(
              '$_text',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
