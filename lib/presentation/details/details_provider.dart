import 'package:flutter/material.dart';
import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/domain/repositories/books_repository.dart';

class DetailsProvider with ChangeNotifier {
  final BooksRepository booksRepository;
  final String isbn13;

  Book book = Book.empty();
  String error = "";

  DetailsProvider({required this.booksRepository, required this.isbn13});

  Future<void> loadData() async {
    error = "";

    final results = await booksRepository.getBookDetails(isbn13);
    results.fold((e) => error = e.error, (b) => book = b);
    notifyListeners();
  }
}
