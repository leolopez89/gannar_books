// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gannar_books/data/datasources/local/local_storage.dart';
import 'package:gannar_books/data/datasources/network/rest_api_client.dart';
import 'package:gannar_books/domain/repositories/books_repository.dart';
import 'package:gannar_books/domain/repositories/users_repository.dart';
import 'package:gannar_books/main.dart';
import 'package:gannar_books/presentation/home/home_page.dart';
import 'package:gannar_books/presentation/home/home_provider.dart';
import 'package:gannar_books/utils/services/services.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fixtures/fixtures.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<SharedPreferences>(as: #MockSharedPreferences),
  MockSpec<LocalStorage>(as: #MockLocalStorage),
  MockSpec<RestApiClient>(as: #MockRestApiClient),
  MockSpec<UsersRepository>(as: #MockUsersRepository),
  MockSpec<BooksRepository>(as: #MockBooksRepository),
  MockSpec<HomeProvider>(as: #MockHomeProvider),
])
void main() {
  MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  MockLocalStorage mockLocalStorage = MockLocalStorage();
  MockRestApiClient mockRestApiClient = MockRestApiClient();
  MockUsersRepository mockUsersRepository = MockUsersRepository();
  MockBooksRepository mockBooksRepository = MockBooksRepository();
  MockHomeProvider mockHomeProvider = MockHomeProvider();

  setUpAll(() async {
    getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);

    getIt.registerSingleton<LocalStorage>(mockLocalStorage);

    getIt.registerSingleton<RestApiClient>(mockRestApiClient);

    getIt.registerSingleton<UsersRepository>(mockUsersRepository);

    getIt.registerSingleton<BooksRepository>(mockBooksRepository);

    getIt.registerFactory<HomeProvider>(() => mockHomeProvider);
  });

  testWidgets('when app start, should see login page',
      (WidgetTester tester) async {
    when(mockLocalStorage.isLogged()).thenAnswer((_) => false);
    when(mockHomeProvider.errors).thenAnswer((_) => []);
    when(mockHomeProvider.user).thenAnswer((_) => testUser.toDomain());

    when(mockUsersRepository.createUser(any))
        .thenAnswer((_) async => const Right(true));
    when(mockUsersRepository.getLoggedUser())
        .thenAnswer((_) async => Right(testUser.toDomain()));
    when(mockUsersRepository.verifyUser(any))
        .thenAnswer((_) async => const Right(true));

    // Build our app and trigger a frame.
    await tester.pumpWidget(const GannarBooks(false));

    // Verify that the login button is present.
    expect(find.byKey(const Key('loginbtn')), findsOneWidget);

    // tap the login button
    await tester.tap(find.byKey(const Key("loginbtn")));
    await tester.pump();

    // verify if validation is working
    expect(find.textContaining("requerido"), findsNWidgets(1));
    expect(find.textContaining("ingresa"), findsNWidgets(1));

    // set the correct values to the input fields
    Finder usernameField = find.byKey(const Key('username'));
    await tester.enterText(usernameField, 'username');

    Finder passwordField = find.byKey(const Key('password'));
    await tester.enterText(passwordField, 'password');

    // tap the login button
    await tester.tap(find.byKey(const Key("loginbtn")));
    await tester.pumpAndSettle();

    // verify that the Home page is visible after login
    expect(find.textContaining("Bienvenido"), findsNWidgets(1));
  });

  testWidgets('when app start, should see home page',
      (WidgetTester tester) async {
    when(mockLocalStorage.isLogged()).thenAnswer((_) => true);
    when(mockHomeProvider.errors).thenAnswer((_) => []);
    when(mockHomeProvider.user).thenAnswer((_) => testUser.toDomain());

    when(mockUsersRepository.getLoggedUser())
        .thenAnswer((_) async => Right(testUser.toDomain()));
    when(mockBooksRepository.getNewBooks())
        .thenAnswer((_) async => Right(testBooks.toDomain()));

    // Build our app and trigger a frame.
    await tester.pumpWidget(const GannarBooks(true));

    // Verify that the login button is not present.
    expect(find.byKey(const Key('loginbtn')), findsNothing);

    // verify that the Home page is visible
    expect(find.byKey(const Key('logoutbtn')), findsWidgets);
    expect(find.byType(HomePage), findsOneWidget);
  });
}
