import 'package:dio/dio.dart';
import 'package:gannar_books/data/dto/book_dto.dart';
import 'package:gannar_books/data/dto/books_dto.dart';
import 'package:gannar_books/utils/constants/strings.dart';

typedef _DoRequestAction<T> = Future<Response>? Function();

/// Interfaz para recuperar datos remotos
abstract class RestApiClient {
  /// Método para obtener los nuevos libros
  ///
  /// Devuelve una instancia de [BooksDto] que contiene un listado de [BookDto]
  Future<BooksDto> getNewBooks();

  /// Método para buscar libros mediante una [query], de forma alternativa se
  /// puede pasar el número de la página [page]
  ///
  /// Devuelve una instancia de [BooksDto] que contiene un listado de [BookDto]
  Future<BooksDto> searchBooks(String query, {int page = 1});

  /// Método para obtener los datos de un libro a partir de su [isbn13]
  ///
  /// Devuelve una instancia de [BookDto]
  Future<BookDto> getBookDetails(String isbn13);
}

/// IMplementación de [RestApiClient] para el acceso a la red
class RestApiClientImpl implements RestApiClient {
  /// Mecanismo de navegación: [Dio]
  final _dio = Dio(BaseOptions(baseUrl: ApiEndoints.baseUrl));

  @override
  Future<BooksDto> getNewBooks({int page = 1}) async {
    final json = await load(resource: ApiEndoints.news);
    final books = BooksDto.fromJson(json);
    return books;
  }

  @override
  Future<BooksDto> searchBooks(String query, {int page = 1}) async {
    String resource = "${ApiEndoints.search}/$query?page=$page";
    final json = await load(resource: resource);
    final books = BooksDto.fromJson(json);
    return books;
  }

  @override
  Future<BookDto> getBookDetails(String isbn13) async {
    String resource = "${ApiEndoints.books}/$isbn13";
    final json = await load(resource: resource);
    final book = BookDto.fromJson(json);
    return book;
  }

  /// Método genérico para el acceso la red
  Future<T?> load<T>({
    required String resource,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async =>
      _doRequest<T>(() async => _dio.get<T>(
            '${_dio.options.baseUrl}/$resource',
            options: Options(
              contentType: "application/json; charset=UTF-8",
              headers: {'Accept': 'application/json'},
            ),
            queryParameters: queryParameters,
            data: data,
          ));

  /// Wrapper para devolver solamente la respuesta. Generalmente es un [Map].
  /// En caso de error se devuelve null.
  Future<T?> _doRequest<T>(_DoRequestAction request) async {
    final response = await request();
    final statusCode = response!.statusCode ?? 0;

    if (statusCode >= 200 && statusCode < 300) {
      // Success response
      return response.data as T?;
    } else {
      return null;
    }
  }
}
