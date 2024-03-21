import 'dart:convert';

import 'package:gannar_books/domain/models/user.dart';

/// Clase para la gestión de un usuario. Contiene los métodos para el
/// procesamiento de los datos obtenidos del almaceniento local o la red
class UserDto {
  String username;
  String password;

  UserDto({required this.username, required this.password});

  UserDto.fromJson(Map<String, dynamic> json)
      : username = json['username'] ?? "",
        password = json['password'] ?? "";

  Map<String, dynamic> toJson() => {'username': username, 'password': password};

  UserDto.fromDomain(User entity)
      : username = entity.username,
        password = entity.password;

  User toDomain() => User(username: username, password: password);

  factory UserDto.fromRawJson(String str) => UserDto.fromJson(jsonDecode(str));

  String toRawJson() => jsonEncode(toJson());
}
