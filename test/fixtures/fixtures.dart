import 'package:gannar_books/data/dto/book_dto.dart';
import 'package:gannar_books/data/dto/books_dto.dart';
import 'package:gannar_books/data/dto/user_dto.dart';

final testBook = BookDto(
  error: "0",
  title: "50 Tips and Tricks for MongoDB Developers",
  subtitle: "Get the Most Out of Your Database",
  authors: "Kristina Chodorow",
  publisher: "O'Reilly Media",
  language: "English",
  isbn10: "1449304613",
  isbn13: "9781449304614",
  pages: "66",
  year: "2011",
  rating: "4",
  desc: "Getting started with MongoDB is easy, but once you begin building",
  price: "\$7.00",
  image: "https://itbook.store/img/books/9781449304614.png",
  url: "https://itbook.store/books/9781449304614",
);

final testBooks = BooksDto(error: "0", total: 2, page: 1, books: [
  BookDto(
    error: "0",
    title: "50 Tips and Tricks for MongoDB Developers",
    subtitle: "Get the Most Out of Your Database",
    authors: "Kristina Chodorow",
    publisher: "O'Reilly Media",
    language: "English",
    isbn10: "1449304613",
    isbn13: "9781449304614",
    pages: "66",
    year: "2011",
    rating: "4",
    desc: "Getting started with MongoDB is easy, but once you begin building",
    price: "\$7.00",
    image: "https://itbook.store/img/books/9781449304614.png",
    url: "https://itbook.store/books/9781449304614",
  ),
  BookDto(
    error: "0",
    title: "The Little MongoDB Book",
    subtitle: "",
    authors: "Karl Seguin",
    publisher: "Self-publishing",
    language: "English",
    isbn10: "1592208320",
    isbn13: "1001592208320",
    pages: "66",
    year: "2016",
    rating: "0",
    desc: "Karl Seguin is a developer with experience across various fields...",
    price: "\$0.00",
    image: "https://itbook.store/img/books/1001592208320.png",
    url: "https://itbook.store/books/1001592208320",
  )
]);

final testUser = UserDto(username: "username", password: "password");
