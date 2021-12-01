import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnSearchFn = void Function(String searchText);

abstract class SearchableBloc<E, S> extends Bloc<E, S> with Searchable {
  SearchableBloc(S initialState) : super(initialState);
}

mixin WidgetWithSearchableBlock on Widget {
  SearchableBloc getBloc(BuildContext context);
}

mixin Searchable {
  void onSearch(String searchText);
}
