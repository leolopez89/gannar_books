import 'package:dartz/dartz.dart';
import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/domain/models/books.dart';
import 'package:gannar_books/utils/resources/error_state.dart';

/// Inferfaz para el acceso a la información de los libros
abstract class BooksRepository {
  /// Obtiene el listado de [Book] nuevos (recién publicados).
  ///
  /// Devuelve una instancia de [Books] que contiene el listado de [Book]
  /// Si se produce una excepción durante el proceso se devuelve el mensaje en
  /// el contenido de [ErrorState]
  Future<Either<ErrorState, Books>> getNewBooks();

  /// Obtiene el listado de [Book] que cumple con el criterio de búsqueda
  /// [query]. Opcionalmente se puede pasar el número de página [page]
  ///
  /// Devuelve una instancia de [Books] que contiene el listado de [Book]
  /// Si se produce una excepción durante el proceso se devuelve el mensaje en
  /// el contenido de [ErrorState]
  Future<Either<ErrorState, Books>> searchBooks(String query, {int page = 1});
}
