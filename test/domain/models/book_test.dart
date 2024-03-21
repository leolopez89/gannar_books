import 'package:flutter_test/flutter_test.dart';
import 'package:gannar_books/domain/models/book.dart';

void main() {
  group('Book', () {
    test('Two instances with the same id should be equal', () {
      final book1 = Book(
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
        desc:
            "Karl Seguin is a developer with experience across various fields...",
        price: "\$0.00",
        image: "https://itbook.store/img/books/1001592208320.png",
        url: "https://itbook.store/books/1001592208320",
      );

      Book book2 = Book(
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
        desc:
            "Karl Seguin is a developer with experience across various fields...",
        price: "\$0.00",
        image: "https://itbook.store/img/books/1001592208320.png",
        url: "https://itbook.store/books/1001592208320",
      );
      expect(book1.isbn13, equals(book2.isbn13));
    });

    test('Two instances with the different id should be different', () {
      final book1 = Book(
        error: "0",
        title: "The Little MongoDB Book",
        subtitle: "",
        authors: "Karl Seguin",
        publisher: "Self-publishing",
        language: "English",
        isbn10: "1592208320",
        isbn13: "1001592208321",
        pages: "66",
        year: "2016",
        rating: "0",
        desc:
            "Karl Seguin is a developer with experience across various fields...",
        price: "\$0.00",
        image: "https://itbook.store/img/books/1001592208320.png",
        url: "https://itbook.store/books/1001592208320",
      );

      Book book2 = Book(
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
        desc:
            "Karl Seguin is a developer with experience across various fields...",
        price: "\$0.00",
        image: "https://itbook.store/img/books/1001592208320.png",
        url: "https://itbook.store/books/1001592208320",
      );
      expect(book1.isbn13, isNot(equals(book2.isbn13)));
    });
  });
}
