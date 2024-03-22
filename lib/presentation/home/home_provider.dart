import 'package:flutter/material.dart';
import 'package:gannar_books/domain/models/books.dart';
import 'package:gannar_books/domain/models/user.dart';
import 'package:gannar_books/domain/repositories/books_repository.dart';
import 'package:gannar_books/domain/repositories/users_repository.dart';

class HomeProvider with ChangeNotifier {
  final UsersRepository usersRepository;
  final BooksRepository booksRepository;

  Books books = Books.empty();
  User user = User.empty();

  List<String> errors = [];

  String _search = "";
  bool _canLogout = false;

  List<String> savedSearches = [];

  HomeProvider({required this.usersRepository, required this.booksRepository});

  String get search => _search;

  bool get canLogout => _canLogout;

  set search(String val) {
    _search = val;
    notifyListeners();
  }

  Future<void> loadLocalData() async {
    errors = [];

    final result = await usersRepository.getLoggedUser();
    result.fold((e) => errors.add(e.error), (u) => user = u);
    notifyListeners();
  }

  Future<void> loadData() async {
    errors = [];

    final results = await booksRepository.getNewBooks();
    results.fold((e) => errors.add(e.error), (b) => books = b);
    notifyListeners();

    final searches = await booksRepository.getSavedSearch();
    searches.fold((e) => errors.add(e.error), (saved) => savedSearches = saved);
    notifyListeners();
  }

  Future<void> saveSearch() async {
    errors = [];
    final result = await booksRepository.saveSearch(search);
    result.fold((e) => errors.add(e.error), (saved) => savedSearches = saved);
    notifyListeners();
  }

  Future<void> logout() async {
    errors = [];

    final result = await usersRepository.logout();
    result.fold((e) => errors.add(e.error), (r) => _canLogout = r);
    notifyListeners();
  }
}
