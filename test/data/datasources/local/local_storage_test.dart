import 'package:flutter_test/flutter_test.dart';
import 'package:gannar_books/data/datasources/local/local_storage.dart';
import 'package:gannar_books/utils/exceptions/user_not_found_exception.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/fixtures.dart';
import 'local_storage_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<SharedPreferences>(as: #MockSharedPreferences),
])
void main() {
  MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  LocalStorageImpl localStorage =
      LocalStorageImpl(sharedPreferences: mockSharedPreferences);

  test('saveUser, should return a valid answer', () async {
    when(mockSharedPreferences.setString(any, any))
        .thenAnswer((_) async => true);

    final result = await localStorage.saveUser(testUser);

    expect(result, true);

    verify(mockSharedPreferences.setString(any, any)).called(1);
    verifyNoMoreInteractions(mockSharedPreferences);
  });

  test('getLoggedUser, should return a valid answer', () async {
    final jsonMap = fixture("user.json");
    when(mockSharedPreferences.getString(any)).thenAnswer((_) => jsonMap);

    final result = await localStorage.getLoggedUser();

    expect(result.username.isNotEmpty, true);

    verify(mockSharedPreferences.getString(any)).called(1);
    verifyNoMoreInteractions(mockSharedPreferences);
  });

  test('getLoggedUser, should return a UserNotFound', () async {
    when(mockSharedPreferences.getString(any)).thenAnswer((_) => null);

    expect(() async => await localStorage.getLoggedUser(),
        throwsA(isA<UserNotFoundException>()));

    verify(mockSharedPreferences.getString(any)).called(1);
    verifyNoMoreInteractions(mockSharedPreferences);
  });

  test('verifyUser, should return a valid answer', () async {
    when(mockSharedPreferences.getString(any)).thenAnswer((_) => "");

    final result = await localStorage.verifyUser(testUser);

    expect(result, false);

    verify(mockSharedPreferences.getString(any)).called(1);
    verifyNoMoreInteractions(mockSharedPreferences);
  });

  test('logout, should return a valid answer', () async {
    when(mockSharedPreferences.remove(any)).thenAnswer((_) async => true);

    final result = await localStorage.logout();

    expect(result, true);

    verify(mockSharedPreferences.remove(any)).called(1);
    verifyNoMoreInteractions(mockSharedPreferences);
  });

  test('isLogged, should return a valid answer', () async {
    when(mockSharedPreferences.getString(any)).thenAnswer((_) => "");

    final result = localStorage.isLogged();

    expect(result, false);

    verify(mockSharedPreferences.getString(any)).called(1);
    verifyNoMoreInteractions(mockSharedPreferences);
  });

  test('getSavedSearch, should return a valid answer', () async {
    when(mockSharedPreferences.getStringList(any))
        .thenAnswer((_) => testStringList);

    final result = await localStorage.getSavedSearch();

    expect(result.isNotEmpty, true);

    verify(mockSharedPreferences.getStringList(any)).called(1);
    verifyNoMoreInteractions(mockSharedPreferences);
  });

  test('saveSearch, should return a valid answer', () async {
    when(mockSharedPreferences.getStringList(any))
        .thenAnswer((_) => testStringList);
    when(mockSharedPreferences.setStringList(any, any))
        .thenAnswer((_) async => true);

    final result = await localStorage.saveSearch("query");

    expect(result.length, 3);

    verify(mockSharedPreferences.getStringList(any)).called(1);
    verify(mockSharedPreferences.setStringList(any, any)).called(1);
    verifyNoMoreInteractions(mockSharedPreferences);
  });
}
