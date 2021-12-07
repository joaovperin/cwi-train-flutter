import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnTapFn<T> = void Function(T value);
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

abstract class EntityMapper<T> {
  const EntityMapper._();

  Map<String, dynamic> toMap(T entity);
  T fromMap(Map<String, dynamic> map);
}

abstract class Entity<T> {
  int get id;
}

abstract class ListRepository<MODEL extends Entity<MODEL>, MODEL_DETAILS> {
  const ListRepository._();

  Future<List<MODEL>> findAll({String? search});

  Future<MODEL> findInfoById(int id);

  Future<MODEL> findInfoByName(String name);

  Future<PaginatedSearchResult<MODEL>> findPage({
    required int page,
    required int size,
  });

  Future<MODEL_DETAILS> findDetailsById(int id);
}
