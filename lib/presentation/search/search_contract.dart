import 'package:gannar_books/domain/models/book.dart';

abstract class SearchContract {
  void showBooksList(List<Book> books);

  void showError(String error);

  void onTapBook(Book book);

  void onTapBack();
}
