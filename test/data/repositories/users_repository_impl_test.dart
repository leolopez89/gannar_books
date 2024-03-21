import 'package:flutter_test/flutter_test.dart';
import 'package:gannar_books/data/datasources/local/local_storage.dart';
import 'package:gannar_books/data/repositories/users_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixtures.dart';
import 'users_repository_impl_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<LocalStorage>(as: #MockLocalStorage),
])
void main() {
  MockLocalStorage mockLocalStorage = MockLocalStorage();
  UsersRepositoryImpl userRepository = UsersRepositoryImpl(mockLocalStorage);

  test('saveUser, should return a valid answer', () async {
    when(mockLocalStorage.saveUser(any)).thenAnswer((_) async => true);

    final result = await userRepository.createUser(testUser.toDomain());

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result, true));

    verify(mockLocalStorage.saveUser(any)).called(1);
    verifyNoMoreInteractions(mockLocalStorage);
  });

  test('getLoggedUser, should return a valid answer', () async {
    when(mockLocalStorage.getLoggedUser()).thenAnswer((_) async => testUser);

    final result = await userRepository.getLoggedUser();

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result.username, "username"));

    verify(mockLocalStorage.getLoggedUser()).called(1);
    verifyNoMoreInteractions(mockLocalStorage);
  });

  test('verifyUser, should return a valid answer', () async {
    when(mockLocalStorage.verifyUser(any)).thenAnswer((_) async => true);

    final result = await userRepository.verifyUser(testUser.toDomain());

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result, true));

    verify(mockLocalStorage.verifyUser(any)).called(1);
    verifyNoMoreInteractions(mockLocalStorage);
  });

  test('logout, should return a valid answer', () async {
    when(mockLocalStorage.logout()).thenAnswer((_) async => true);

    final result = await userRepository.logout();

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result, true));

    verify(mockLocalStorage.logout()).called(1);
    verifyNoMoreInteractions(mockLocalStorage);
  });
}
