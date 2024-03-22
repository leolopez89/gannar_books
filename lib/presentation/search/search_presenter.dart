import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/presentation/search/search_contract.dart';
import 'package:gannar_books/presentation/search/search_provider.dart';

class SearchPresenter {
  final SearchProvider provider;

  final SearchContract view;

  SearchPresenter({required this.provider, required this.view});

  Future<void> goBack() async => view.onTapBack();

  Future<void> loadData() async {
    await provider.doSearch();
    if (provider.error.isEmpty) {
      view.showBooksList(provider.books.books);
    } else {
      view.showError(provider.error);
    }
  }

  void viewDetails(Book book) {
    view.onTapBook(book);
  }
}
