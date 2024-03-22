// Mocks generated by Mockito 5.4.2 from annotations
// in gannar_books/test/widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:ui' as _i17;

import 'package:dartz/dartz.dart' as _i5;
import 'package:gannar_books/data/datasources/local/local_storage.dart' as _i12;
import 'package:gannar_books/data/datasources/network/rest_api_client.dart'
    as _i13;
import 'package:gannar_books/data/dto/book_dto.dart' as _i4;
import 'package:gannar_books/data/dto/books_dto.dart' as _i3;
import 'package:gannar_books/data/dto/user_dto.dart' as _i2;
import 'package:gannar_books/domain/models/book.dart' as _i15;
import 'package:gannar_books/domain/models/books.dart' as _i8;
import 'package:gannar_books/domain/models/user.dart' as _i9;
import 'package:gannar_books/domain/repositories/books_repository.dart' as _i7;
import 'package:gannar_books/domain/repositories/users_repository.dart' as _i6;
import 'package:gannar_books/presentation/home/home_provider.dart' as _i16;
import 'package:gannar_books/utils/resources/error_state.dart' as _i14;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserDto_0 extends _i1.SmartFake implements _i2.UserDto {
  _FakeUserDto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBooksDto_1 extends _i1.SmartFake implements _i3.BooksDto {
  _FakeBooksDto_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBookDto_2 extends _i1.SmartFake implements _i4.BookDto {
  _FakeBookDto_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_3<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUsersRepository_4 extends _i1.SmartFake
    implements _i6.UsersRepository {
  _FakeUsersRepository_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBooksRepository_5 extends _i1.SmartFake
    implements _i7.BooksRepository {
  _FakeBooksRepository_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBooks_6 extends _i1.SmartFake implements _i8.Books {
  _FakeBooks_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_7 extends _i1.SmartFake implements _i9.User {
  _FakeUser_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i10.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(
          #getKeys,
          [],
        ),
        returnValue: <String>{},
      ) as Set<String>);

  @override
  Object? get(String? key) => (super.noSuchMethod(Invocation.method(
        #get,
        [key],
      )) as Object?);

  @override
  bool? getBool(String? key) => (super.noSuchMethod(Invocation.method(
        #getBool,
        [key],
      )) as bool?);

  @override
  int? getInt(String? key) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [key],
      )) as int?);

  @override
  double? getDouble(String? key) => (super.noSuchMethod(Invocation.method(
        #getDouble,
        [key],
      )) as double?);

  @override
  String? getString(String? key) => (super.noSuchMethod(Invocation.method(
        #getString,
        [key],
      )) as String?);

  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [key],
      )) as List<String>?);

  @override
  _i11.Future<bool> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(
          #commit,
          [],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
}

/// A class which mocks [LocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorage extends _i1.Mock implements _i12.LocalStorage {
  MockLocalStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<bool> saveUser(_i2.UserDto? user) => (super.noSuchMethod(
        Invocation.method(
          #saveUser,
          [user],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<_i2.UserDto> getLoggedUser() => (super.noSuchMethod(
        Invocation.method(
          #getLoggedUser,
          [],
        ),
        returnValue: _i11.Future<_i2.UserDto>.value(_FakeUserDto_0(
          this,
          Invocation.method(
            #getLoggedUser,
            [],
          ),
        )),
      ) as _i11.Future<_i2.UserDto>);

  @override
  bool isLogged() => (super.noSuchMethod(
        Invocation.method(
          #isLogged,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i11.Future<bool> verifyUser(_i2.UserDto? user) => (super.noSuchMethod(
        Invocation.method(
          #verifyUser,
          [user],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<List<String>> getSavedSearch() => (super.noSuchMethod(
        Invocation.method(
          #getSavedSearch,
          [],
        ),
        returnValue: _i11.Future<List<String>>.value(<String>[]),
      ) as _i11.Future<List<String>>);

  @override
  _i11.Future<List<String>> saveSearch(String? query) => (super.noSuchMethod(
        Invocation.method(
          #saveSearch,
          [query],
        ),
        returnValue: _i11.Future<List<String>>.value(<String>[]),
      ) as _i11.Future<List<String>>);
}

/// A class which mocks [RestApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestApiClient extends _i1.Mock implements _i13.RestApiClient {
  MockRestApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i3.BooksDto> getNewBooks() => (super.noSuchMethod(
        Invocation.method(
          #getNewBooks,
          [],
        ),
        returnValue: _i11.Future<_i3.BooksDto>.value(_FakeBooksDto_1(
          this,
          Invocation.method(
            #getNewBooks,
            [],
          ),
        )),
      ) as _i11.Future<_i3.BooksDto>);

  @override
  _i11.Future<_i3.BooksDto> searchBooks(
    String? query, {
    int? page = 1,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchBooks,
          [query],
          {#page: page},
        ),
        returnValue: _i11.Future<_i3.BooksDto>.value(_FakeBooksDto_1(
          this,
          Invocation.method(
            #searchBooks,
            [query],
            {#page: page},
          ),
        )),
      ) as _i11.Future<_i3.BooksDto>);

  @override
  _i11.Future<_i4.BookDto> getBookDetails(String? isbn13) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBookDetails,
          [isbn13],
        ),
        returnValue: _i11.Future<_i4.BookDto>.value(_FakeBookDto_2(
          this,
          Invocation.method(
            #getBookDetails,
            [isbn13],
          ),
        )),
      ) as _i11.Future<_i4.BookDto>);
}

/// A class which mocks [UsersRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsersRepository extends _i1.Mock implements _i6.UsersRepository {
  MockUsersRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i5.Either<_i14.ErrorState, bool>> createUser(_i9.User? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [user],
        ),
        returnValue: _i11.Future<_i5.Either<_i14.ErrorState, bool>>.value(
            _FakeEither_3<_i14.ErrorState, bool>(
          this,
          Invocation.method(
            #createUser,
            [user],
          ),
        )),
      ) as _i11.Future<_i5.Either<_i14.ErrorState, bool>>);

  @override
  _i11.Future<_i5.Either<_i14.ErrorState, _i9.User>> getLoggedUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLoggedUser,
          [],
        ),
        returnValue: _i11.Future<_i5.Either<_i14.ErrorState, _i9.User>>.value(
            _FakeEither_3<_i14.ErrorState, _i9.User>(
          this,
          Invocation.method(
            #getLoggedUser,
            [],
          ),
        )),
      ) as _i11.Future<_i5.Either<_i14.ErrorState, _i9.User>>);

  @override
  _i11.Future<_i5.Either<_i14.ErrorState, bool>> verifyUser(_i9.User? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyUser,
          [user],
        ),
        returnValue: _i11.Future<_i5.Either<_i14.ErrorState, bool>>.value(
            _FakeEither_3<_i14.ErrorState, bool>(
          this,
          Invocation.method(
            #verifyUser,
            [user],
          ),
        )),
      ) as _i11.Future<_i5.Either<_i14.ErrorState, bool>>);

  @override
  _i11.Future<_i5.Either<_i14.ErrorState, bool>> logout() =>
      (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i11.Future<_i5.Either<_i14.ErrorState, bool>>.value(
            _FakeEither_3<_i14.ErrorState, bool>(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
      ) as _i11.Future<_i5.Either<_i14.ErrorState, bool>>);
}

/// A class which mocks [BooksRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBooksRepository extends _i1.Mock implements _i7.BooksRepository {
  MockBooksRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i5.Either<_i14.ErrorState, _i8.Books>> getNewBooks() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNewBooks,
          [],
        ),
        returnValue: _i11.Future<_i5.Either<_i14.ErrorState, _i8.Books>>.value(
            _FakeEither_3<_i14.ErrorState, _i8.Books>(
          this,
          Invocation.method(
            #getNewBooks,
            [],
          ),
        )),
      ) as _i11.Future<_i5.Either<_i14.ErrorState, _i8.Books>>);

  @override
  _i11.Future<_i5.Either<_i14.ErrorState, _i8.Books>> searchBooks(
    String? query, {
    int? page = 1,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchBooks,
          [query],
          {#page: page},
        ),
        returnValue: _i11.Future<_i5.Either<_i14.ErrorState, _i8.Books>>.value(
            _FakeEither_3<_i14.ErrorState, _i8.Books>(
          this,
          Invocation.method(
            #searchBooks,
            [query],
            {#page: page},
          ),
        )),
      ) as _i11.Future<_i5.Either<_i14.ErrorState, _i8.Books>>);

  @override
  _i11.Future<_i5.Either<_i14.ErrorState, _i15.Book>> getBookDetails(
          String? isbn13) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBookDetails,
          [isbn13],
        ),
        returnValue: _i11.Future<_i5.Either<_i14.ErrorState, _i15.Book>>.value(
            _FakeEither_3<_i14.ErrorState, _i15.Book>(
          this,
          Invocation.method(
            #getBookDetails,
            [isbn13],
          ),
        )),
      ) as _i11.Future<_i5.Either<_i14.ErrorState, _i15.Book>>);

  @override
  _i11.Future<_i5.Either<_i14.ErrorState, List<String>>> saveSearch(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveSearch,
          [query],
        ),
        returnValue:
            _i11.Future<_i5.Either<_i14.ErrorState, List<String>>>.value(
                _FakeEither_3<_i14.ErrorState, List<String>>(
          this,
          Invocation.method(
            #saveSearch,
            [query],
          ),
        )),
      ) as _i11.Future<_i5.Either<_i14.ErrorState, List<String>>>);

  @override
  _i11.Future<_i5.Either<_i14.ErrorState, List<String>>> getSavedSearch() =>
      (super.noSuchMethod(
        Invocation.method(
          #getSavedSearch,
          [],
        ),
        returnValue:
            _i11.Future<_i5.Either<_i14.ErrorState, List<String>>>.value(
                _FakeEither_3<_i14.ErrorState, List<String>>(
          this,
          Invocation.method(
            #getSavedSearch,
            [],
          ),
        )),
      ) as _i11.Future<_i5.Either<_i14.ErrorState, List<String>>>);
}

/// A class which mocks [HomeProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeProvider extends _i1.Mock implements _i16.HomeProvider {
  MockHomeProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.UsersRepository get usersRepository => (super.noSuchMethod(
        Invocation.getter(#usersRepository),
        returnValue: _FakeUsersRepository_4(
          this,
          Invocation.getter(#usersRepository),
        ),
      ) as _i6.UsersRepository);

  @override
  _i7.BooksRepository get booksRepository => (super.noSuchMethod(
        Invocation.getter(#booksRepository),
        returnValue: _FakeBooksRepository_5(
          this,
          Invocation.getter(#booksRepository),
        ),
      ) as _i7.BooksRepository);

  @override
  _i8.Books get books => (super.noSuchMethod(
        Invocation.getter(#books),
        returnValue: _FakeBooks_6(
          this,
          Invocation.getter(#books),
        ),
      ) as _i8.Books);

  @override
  set books(_i8.Books? _books) => super.noSuchMethod(
        Invocation.setter(
          #books,
          _books,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.User get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _FakeUser_7(
          this,
          Invocation.getter(#user),
        ),
      ) as _i9.User);

  @override
  set user(_i9.User? _user) => super.noSuchMethod(
        Invocation.setter(
          #user,
          _user,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<String> get errors => (super.noSuchMethod(
        Invocation.getter(#errors),
        returnValue: <String>[],
      ) as List<String>);

  @override
  set errors(List<String>? _errors) => super.noSuchMethod(
        Invocation.setter(
          #errors,
          _errors,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<String> get savedSearches => (super.noSuchMethod(
        Invocation.getter(#savedSearches),
        returnValue: <String>[],
      ) as List<String>);

  @override
  set savedSearches(List<String>? _savedSearches) => super.noSuchMethod(
        Invocation.setter(
          #savedSearches,
          _savedSearches,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get search => (super.noSuchMethod(
        Invocation.getter(#search),
        returnValue: '',
      ) as String);

  @override
  bool get canLogout => (super.noSuchMethod(
        Invocation.getter(#canLogout),
        returnValue: false,
      ) as bool);

  @override
  set search(String? val) => super.noSuchMethod(
        Invocation.setter(
          #search,
          val,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i11.Future<void> loadLocalData() => (super.noSuchMethod(
        Invocation.method(
          #loadLocalData,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> loadData() => (super.noSuchMethod(
        Invocation.method(
          #loadData,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> saveSearch() => (super.noSuchMethod(
        Invocation.method(
          #saveSearch,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  void addListener(_i17.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i17.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
