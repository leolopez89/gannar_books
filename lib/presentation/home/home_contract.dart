import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/domain/models/user.dart';

abstract class HomeContract {
  void showLoggedUser(User user);

  void showNewBooks(List<Book> books);

  void onTapBook(Book book);

  void onTapSearch(String search);

  void onLogout();

  void showErrors(List<String> errors);
}
