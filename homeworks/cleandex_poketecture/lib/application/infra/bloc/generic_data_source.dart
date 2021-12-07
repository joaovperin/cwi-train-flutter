import 'package:cleandex_poketecture/commons/interfaces.dart';

abstract class GenericDataSource<MODEL extends Entity<MODEL>, DETAILS> {
  int currentPage;
  int rowsCount;
  int get itemsPerPage => 40;

  GenericDataSource()
      : currentPage = 0,
        rowsCount = 0;

  ListRepository<MODEL, DETAILS> get repository;

  Future<List<MODEL>> searchByName(String search) async {
    return repository.findAll(search: search);
  }

  Future<DETAILS> findDetails(MODEL modelInfo) {
    return repository.findDetailsById(modelInfo.id);
  }

  Future<List<MODEL>> fetchNextPage() async {
    final page = await repository.findPage(
      page: currentPage++,
      size: itemsPerPage,
    );

    if (page.isLastPage) {
      throw NoMoreRowsException();
    }

    rowsCount = page.count;
    return page.results;
  }

  void resetCounter() {
    currentPage = 0;
    rowsCount = 0;
  }
}

class NoMoreRowsException implements Exception {}

class NotFoundException implements Exception {}
