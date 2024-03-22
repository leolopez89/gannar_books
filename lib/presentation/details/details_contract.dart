import 'package:gannar_books/domain/models/book.dart';

abstract class DetailsContract {
  void showBookDetails(Book book);

  void showError(String error);

  void onTapBack();
}
