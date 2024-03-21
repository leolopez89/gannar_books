import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gannar_books/data/dto/user_dto.dart';

import '../../fixtures/fixture_reader.dart';
import '../../fixtures/fixtures.dart';

void main() {
  group('UserDto', () {
    test('from/toDomain should have the same information', () {
      final userDomain = testUser.toDomain();
      final userDto = UserDto.fromDomain(userDomain);
      expect(userDomain.username, userDto.username);
    });

    test('toJson, should return a valid json', () {
      final userJson = testUser.toJson();
      expect(userJson["username"], testUser.username);
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("user.json")) as Map<String, dynamic>;
      final result = UserDto.fromJson(jsonMap);
      expect(result.username, jsonMap["username"]);
    });
  });
}
