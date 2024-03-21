import 'package:gannar_books/domain/models/book.dart';

/// Clase para la gestión de un libro. Contiene los métodos para el
/// procesamiento de los datos obtenidos del almaceniento local o la red
class BookDto {
  String error;
  String title;
  String subtitle;
  String authors;
  String publisher;
  String language;
  String isbn10;
  String isbn13;
  String pages;
  String year;
  String rating;
  String desc;
  String price;
  String image;
  String url;

  BookDto({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
  });

  BookDto.fromJson(Map<String, dynamic> json)
      : error = json['error'] ?? "",
        title = json['title'] ?? "",
        subtitle = json['subtitle'] ?? "",
        authors = json['authors'] ?? "",
        publisher = json['publisher'] ?? "",
        language = json['language'] ?? "",
        isbn10 = json['isbn10'] ?? "",
        isbn13 = json['isbn13'] ?? "",
        pages = json['pages'] ?? "",
        year = json['year'] ?? "",
        rating = json['rating'] ?? "",
        desc = json['desc'] ?? "",
        price = json['price'] ?? "",
        image = json['image'] ?? "",
        url = json['url'] ?? "";

  Map<String, dynamic> toJson() => {
        'error': error,
        'title': title,
        'subtitle': subtitle,
        'authors': authors,
        'publisher': publisher,
        'language': language,
        'isbn10': isbn10,
        'isbn13': isbn13,
        'pages': pages,
        'year': year,
        'rating': rating,
        'desc': desc,
        'price': price,
        'image': image,
        'url': url,
      };

  BookDto.fromDomain(Book entity)
      : error = entity.error,
        title = entity.title,
        subtitle = entity.subtitle,
        authors = entity.authors,
        publisher = entity.publisher,
        language = entity.language,
        isbn10 = entity.isbn10,
        isbn13 = entity.isbn13,
        pages = entity.pages,
        year = entity.year,
        rating = entity.rating,
        desc = entity.desc,
        price = entity.price,
        image = entity.image,
        url = entity.url;

  Book toDomain() => Book(
        error: error,
        title: title,
        subtitle: subtitle,
        authors: authors,
        publisher: publisher,
        language: language,
        isbn10: isbn10,
        isbn13: isbn13,
        pages: pages,
        year: year,
        rating: rating,
        desc: desc,
        price: price,
        image: image,
        url: url,
      );
}
