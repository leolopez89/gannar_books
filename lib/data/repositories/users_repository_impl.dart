import 'package:dartz/dartz.dart';
import 'package:gannar_books/data/datasources/local/local_storage.dart';
import 'package:gannar_books/data/datasources/network/rest_api_client.dart';
import 'package:gannar_books/data/dto/user_dto.dart';
import 'package:gannar_books/data/repositories/base/process_exception.dart';
import 'package:gannar_books/domain/models/user.dart';
import 'package:gannar_books/domain/repositories/users_repository.dart';
import 'package:gannar_books/utils/resources/error_state.dart';

/// Implementación concreta de [UsersRepository], extiende [ProcessException]
/// para envolver las respuestas ([Either]) y no lanzar excepciones al usuario
class UsersRepositoryImpl extends ProcessException implements UsersRepository {
  /// Mecanismo de acceso a la los datos locales: [RestApiClient]
  final LocalStorage localStorage;

  UsersRepositoryImpl(this.localStorage);

  @override
  Future<Either<ErrorState, bool>> createUser(User user) {
    return process<bool>(request: () async {
      final result = await localStorage.saveUser(UserDto.fromDomain(user));
      return result;
    });
  }

  @override
  Future<Either<ErrorState, User>> getLoggedUser() {
    return process<User>(request: () async {
      final result = await localStorage.getLoggedUser();
      return result.toDomain();
    });
  }

  @override
  Future<Either<ErrorState, bool>> verifyUser(User user) {
    return process<bool>(request: () async {
      final result = await localStorage.verifyUser(UserDto.fromDomain(user));
      return result;
    });
  }

  @override
  Future<Either<ErrorState, bool>> logout() {
    return process<bool>(request: () async {
      final result = await localStorage.logout();
      return result;
    });
  }
}
