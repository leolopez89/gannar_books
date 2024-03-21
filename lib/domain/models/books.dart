import 'package:gannar_books/domain/models/book.dart';

/// Entidad que contiene un listado de [Book] y la información de paginación
/// - [total] cantida de elementos
/// - [page] número de la página
/// - [error] representa si hay error o no. "0" indica que no hay error
class Books {
  String error;
  int total;
  int page;
  List<Book> books;

  Books({
    required this.error,
    required this.total,
    required this.page,
    required this.books,
  });
}
