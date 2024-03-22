import 'package:gannar_books/data/dto/book_dto.dart';
import 'package:gannar_books/domain/models/books.dart';

/// Clase para la gestión de la respuesta de la red del listado de [BookDto].
/// Contiene los métodos para el procesamiento de los datos obtenidos del
/// almaceniento local o la red.
class BooksDto {
  String error;
  int total;
  int page;
  List<BookDto> books;

  BooksDto({
    required this.error,
    required this.total,
    required this.page,
    required this.books,
  });

  BooksDto.fromJson(Map<String, dynamic> json)
      : error = json['error'] ?? "0",
        total = int.tryParse(json['total'] ?? "0") ?? 0,
        page = int.tryParse(json['page'] ?? "1") ?? 1,
        books = (json['books'] ?? [])
            .map((bookJson) => BookDto.fromJson(bookJson))
            .toList()
            .cast<BookDto>();

  Map<String, dynamic> toJson() => {
        'error': error,
        'total': "$total",
        'page': "$page",
        'books': books.map((book) => book.toJson()).toList(),
      };

  BooksDto.fromDomain(Books entity)
      : error = entity.error,
        total = entity.total,
        page = entity.page,
        books = entity.books.map((e) => BookDto.fromDomain(e)).toList();

  Books toDomain() => Books(
        error: error,
        total: total,
        page: page,
        books: books.map((e) => e.toDomain()).toList(),
      );
}
