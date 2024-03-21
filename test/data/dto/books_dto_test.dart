import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gannar_books/data/dto/books_dto.dart';

import '../../fixtures/fixture_reader.dart';
import '../../fixtures/fixtures.dart';

void main() {
  group('BooksDto', () {
    test('from/toDomain should have the same information', () {
      final booksDomain = testBooks.toDomain();
      final booksDto = BooksDto.fromDomain(booksDomain);
      expect(booksDomain.page, booksDto.page);
      expect(booksDomain.books.length, booksDto.books.length);
      expect(booksDomain.books.first.isbn13, booksDto.books.first.isbn13);
    });

    test('toJson, should return a valid json', () {
      final booksJson = testBooks.toJson();
      expect(booksJson["page"], testBooks.page.toString());
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("books.json")) as Map<String, dynamic>;
      final result = BooksDto.fromJson(jsonMap);
      expect(result.page.toString(), jsonMap["page"]);
    });
  });
}
