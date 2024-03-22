/// Entidad que contiene los datos de un libro
/// - [error] representa si hay error o no. "0" indica que no hay error
/// - [title] título del libro
/// - [subtitle] sub título del libro
/// - [price] precio del libro
class Book {
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

  Book({
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

  Book.empty()
      : error = "",
        title = "",
        subtitle = "",
        authors = "",
        publisher = "",
        language = "",
        isbn10 = "",
        isbn13 = "",
        pages = "",
        year = "",
        rating = "",
        desc = "",
        price = "",
        image = "",
        url = "";

  @override
  int get hashCode => isbn13.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          isbn13 == other.isbn13;
}
