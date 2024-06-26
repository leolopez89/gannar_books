// Mocks generated by Mockito 5.4.2 from annotations
// in gannar_books/test/data/repositories/users_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:gannar_books/data/datasources/local/local_storage.dart' as _i3;
import 'package:gannar_books/data/dto/user_dto.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

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

/// A class which mocks [LocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorage extends _i1.Mock implements _i3.LocalStorage {
  MockLocalStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> saveUser(_i2.UserDto? user) => (super.noSuchMethod(
        Invocation.method(
          #saveUser,
          [user],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<_i2.UserDto> getLoggedUser() => (super.noSuchMethod(
        Invocation.method(
          #getLoggedUser,
          [],
        ),
        returnValue: _i4.Future<_i2.UserDto>.value(_FakeUserDto_0(
          this,
          Invocation.method(
            #getLoggedUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.UserDto>);

  @override
  bool isLogged() => (super.noSuchMethod(
        Invocation.method(
          #isLogged,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i4.Future<bool> verifyUser(_i2.UserDto? user) => (super.noSuchMethod(
        Invocation.method(
          #verifyUser,
          [user],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<List<String>> getSavedSearch() => (super.noSuchMethod(
        Invocation.method(
          #getSavedSearch,
          [],
        ),
        returnValue: _i4.Future<List<String>>.value(<String>[]),
      ) as _i4.Future<List<String>>);

  @override
  _i4.Future<List<String>> saveSearch(String? query) => (super.noSuchMethod(
        Invocation.method(
          #saveSearch,
          [query],
        ),
        returnValue: _i4.Future<List<String>>.value(<String>[]),
      ) as _i4.Future<List<String>>);
}
