import 'package:dartz/dartz.dart';
import 'package:gannar_books/data/datasources/network/rest_api_client.dart';
import 'package:gannar_books/data/repositories/base/process_exception.dart';
import 'package:gannar_books/domain/models/books.dart';
import 'package:gannar_books/domain/repositories/books_repository.dart';
import 'package:gannar_books/utils/resources/error_state.dart';

/// Implementación concreta de [BooksRepository], extiende [ProcessException]
/// para envolver la respuesta ([Either]) y no lanzar excepciones al usuario
class BooksRepositoryImpl extends ProcessException implements BooksRepository {
  /// Mecanismo de acceso a la red: [RestApiClient]
  final RestApiClient apiClient;

  BooksRepositoryImpl(this.apiClient);

  @override
  Future<Either<ErrorState, Books>> getNewBooks() async {
    return process<Books>(request: () async {
      final result = await apiClient.getNewBooks();
      return result.toDomain();
    });
  }

  @override
  Future<Either<ErrorState, Books>> searchBooks(String query, {int page = 1}) {
    return process<Books>(request: () async {
      final result = await apiClient.searchBooks(query, page: page);
      return result.toDomain();
    });
  }
}
