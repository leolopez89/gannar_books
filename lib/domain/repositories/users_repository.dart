import 'package:dartz/dartz.dart';
import 'package:gannar_books/domain/models/user.dart';
import 'package:gannar_books/utils/resources/error_state.dart';

/// Inferfaz para el acceso a la información almacenada localmente del usuario
/// [User]
abstract class UsersRepository {
  /// Permite crear un nuevo usuario [User].
  ///
  /// Devuelve true en caso de éxito, false de fallo.
  /// Si se produce una excepción durante el proceso se devuelve el mensaje en
  /// el contenido de [ErrorState]
  Future<Either<ErrorState, bool>> createUser(User user);

  /// Obtiene los datos del usuario logueado [User]
  ///
  /// Devuelve [User] en caso de éxito
  /// Si se produce una excepción durante el proceso se devuelve el mensaje en
  /// el contenido de [ErrorState]
  Future<Either<ErrorState, User>> getLoggedUser();

  /// Permite verificar si los datos de [user] están almacenados en el
  /// dispositivo
  ///
  /// Devuelve true en caso de éxito, false en otro caso
  /// Si se produce una excepción durante el proceso se devuelve el mensaje en
  /// el contenido de [ErrorState]
  Future<Either<ErrorState, bool>> verifyUser(User user);

  /// Elimina los datos del usuario logueado [User]
  ///
  /// Devuelve true en caso de éxito, false en otro caso
  /// Si se produce una excepción durante el proceso se devuelve el mensaje en
  /// el contenido de [ErrorState]
  Future<Either<ErrorState, bool>> logout();
}
