import 'package:dartz/dartz.dart';
import 'package:gannar_books/data/datasources/local/local_storage.dart';
import 'package:gannar_books/data/datasources/network/rest_api_client.dart';
import 'package:gannar_books/data/repositories/base/process_exception.dart';
import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/domain/models/books.dart';
import 'package:gannar_books/domain/repositories/books_repository.dart';
import 'package:gannar_books/utils/resources/error_state.dart';

/// Implementación concreta de [BooksRepository], extiende [ProcessException]
/// para envolver la respuesta ([Either]) y no lanzar excepciones al usuario
class BooksRepositoryImpl extends ProcessException implements BooksRepository {
  /// Mecanismo de acceso a la red: [RestApiClient]
  final RestApiClient apiClient;
  final LocalStorage localStorage;

  BooksRepositoryImpl(this.apiClient, this.localStorage);

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

  @override
  Future<Either<ErrorState, Book>> getBookDetails(String isbn13) {
    return process<Book>(request: () async {
      final result = await apiClient.getBookDetails(isbn13);
      return result.toDomain();
    });
  }

  @override
  Future<Either<ErrorState, List<String>>> getSavedSearch() {
    return process<List<String>>(request: () async {
      final result = await localStorage.getSavedSearch();
      return result;
    });
  }

  @override
  Future<Either<ErrorState, List<String>>> saveSearch(String query) {
    return process<List<String>>(request: () async {
      final result = await localStorage.saveSearch(query);
      return result;
    });
  }
}
