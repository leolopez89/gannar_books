import 'package:flutter_test/flutter_test.dart';
import 'package:gannar_books/data/datasources/network/rest_api_client.dart';
import 'package:gannar_books/data/repositories/books_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixtures.dart';
import 'books_repository_impl_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<RestApiClient>(as: #MockRestApiClient),
])
void main() {
  MockRestApiClient mockRestApiClient = MockRestApiClient();
  BooksRepositoryImpl userRepository = BooksRepositoryImpl(mockRestApiClient);

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
}
