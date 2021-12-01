import 'dart:async';

import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:flutter/material.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({
    required this.onSearch,
    this.debounceTime = 220,
    Key? key,
  }) : super(key: key);

  final OnSearchFn onSearch;
  final int debounceTime;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  final TextEditingController _searchCtrl = TextEditingController();

  Timer? _searchDebounce;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        controller: _searchCtrl,
        onChanged: (_) => _doSearch(),
        cursorColor: AppColors.inputText,
        decoration: InputDecoration(
          labelText: 'Search',
          labelStyle: TextStyle(
            color: AppColors.inputText,
          ),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            color: AppColors.inputText,
            onPressed: () => _doSearch(),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            color: AppColors.inputText,
            onPressed: () => _searchCtrl.clear(),
          ),
        ),
      ),
    );
  }

  void _doSearch() {
    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();
    _searchDebounce = Timer(Duration(milliseconds: widget.debounceTime), () {
      final value = _searchCtrl.text.trim();
      widget.onSearch.call(value);
    });
  }
}
