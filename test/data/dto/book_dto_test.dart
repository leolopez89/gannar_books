import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gannar_books/data/dto/book_dto.dart';

import '../../fixtures/fixture_reader.dart';
import '../../fixtures/fixtures.dart';

void main() {
  group('BookDto', () {
    test('from/toDomain should have the same information', () {
      final bookDomain = testBook.toDomain();
      final bookDto = BookDto.fromDomain(bookDomain);
      expect(bookDomain.isbn13, bookDto.isbn13);
    });

    test('toJson, should return a valid json', () {
      final bookJson = testBook.toJson();
      expect(bookJson["isbn13"], testBook.isbn13);
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("book.json")) as Map<String, dynamic>;
      final result = BookDto.fromJson(jsonMap);
      expect(result.isbn13, jsonMap["isbn13"]);
    });
  });
}
