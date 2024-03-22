import 'package:flutter/material.dart';
import 'package:gannar_books/domain/models/books.dart';
import 'package:gannar_books/domain/repositories/books_repository.dart';

class SearchProvider with ChangeNotifier {
  final BooksRepository booksRepository;
  final String query;

  Books books = Books.empty();
  String error = "";
  int page = 1;

  SearchProvider({required this.booksRepository, required this.query});

  Future<void> doSearch() async {
    error = "";

    final results = await booksRepository.searchBooks(query, page: page);
    results.fold((e) => error = e.error, (b) {
      books = b;
      if (books.books.isNotEmpty) page++;
    });
    notifyListeners();
  }
}
