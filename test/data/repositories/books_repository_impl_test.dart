import 'package:flutter_test/flutter_test.dart';
import 'package:gannar_books/data/datasources/local/local_storage.dart';
import 'package:gannar_books/data/datasources/network/rest_api_client.dart';
import 'package:gannar_books/data/repositories/books_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixtures.dart';
import 'books_repository_impl_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<RestApiClient>(as: #MockRestApiClient),
  MockSpec<LocalStorage>(as: #MockLocalStorage),
])
void main() {
  MockRestApiClient mockRestApiClient = MockRestApiClient();
  MockLocalStorage mockLocalStorage = MockLocalStorage();
  BooksRepositoryImpl userRepository =
      BooksRepositoryImpl(mockRestApiClient, mockLocalStorage);

  test('getNewBooks, should return a valid answer', () async {
    when(mockRestApiClient.getNewBooks()).thenAnswer((_) async => testBooks);

    final result = await userRepository.getNewBooks();

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result.total, 2));

    verify(mockRestApiClient.getNewBooks()).called(1);
    verifyNoMoreInteractions(mockRestApiClient);
  });

  test('searchBooks, should return a valid answer', () async {
    when(mockRestApiClient.searchBooks(any)).thenAnswer((_) async => testBooks);

    final result = await userRepository.searchBooks("search");

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result.total, 2));

    verify(mockRestApiClient.searchBooks(any)).called(1);
    verifyNoMoreInteractions(mockRestApiClient);
  });

  test('getBookDetails, should return a valid answer', () async {
    when(mockRestApiClient.getBookDetails(any))
        .thenAnswer((_) async => testBook);

    final result = await userRepository.getBookDetails("isbn13");

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result.isbn13.isNotEmpty, true));

    verify(mockRestApiClient.getBookDetails(any)).called(1);
    verifyNoMoreInteractions(mockRestApiClient);
  });
  test('getSavedSearch, should return a valid answer', () async {
    when(mockLocalStorage.getSavedSearch())
        .thenAnswer((_) async => testStringList);

    final result = await userRepository.getSavedSearch();

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result.length, 2));

    verify(mockLocalStorage.getSavedSearch()).called(1);
    verifyNoMoreInteractions(mockLocalStorage);
  });

  test('saveSearch, should return a valid answer', () async {
    when(mockLocalStorage.saveSearch(any))
        .thenAnswer((_) async => testStringList);

    final result = await userRepository.saveSearch("search");

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result.length, 2));

    verify(mockLocalStorage.saveSearch(any)).called(1);
    verifyNoMoreInteractions(mockLocalStorage);
  });
}
