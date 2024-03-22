import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/presentation/home/home_contract.dart';
import 'package:gannar_books/presentation/home/home_provider.dart';
import 'package:gannar_books/utils/services/connectivity.dart';

class HomePresenter {
  final HomeProvider homeProvider;

  final HomeContract view;

  HomePresenter({required this.homeProvider, required this.view});

  List<String> get searches => homeProvider.savedSearches;

  void updateSearch(String search) => homeProvider.search = search;

  Future<void> logout() async {
    await homeProvider.logout();

    if (homeProvider.canLogout) {
      view.onLogout();
    } else {
      view.showErrors(homeProvider.errors);
    }
  }

  Future<void> loadData() async {
    await homeProvider.loadLocalData();
    if (homeProvider.errors.isEmpty) {
      view.showLoggedUser(homeProvider.user);
    } else {
      view.showErrors(homeProvider.errors);
    }

    if (!await checkConnection()) return;
    await homeProvider.loadData();
    if (homeProvider.errors.isEmpty) {
      view.showNewBooks(homeProvider.books.books.take(10).toList());
    } else {
      view.showErrors(homeProvider.errors);
    }
  }

  Future<void> search() async {
    if (!await checkConnection()) return;

    if (homeProvider.search.trim().isEmpty) {
      view.showErrors(["Escribe algo para buscar"]);
    } else if (homeProvider.search.trim().length <= 2) {
      view.showErrors(["Escribe algo más largo para buscar"]);
    } else {
      homeProvider.saveSearch();
      view.onTapSearch(homeProvider.search);
    }
  }

  void viewDetails(Book book) async {
    if (!await checkConnection()) return;

    view.onTapBook(book);
  }

  Future<bool> checkConnection() async {
    bool result = await hasConnection();
    if (!result) view.showErrors(["No hay conexión. Intente más tarde"]);
    return result;
  }
}
