/// Interfaz para los diferentes estados de error
abstract class ErrorState {
  final String error;

  const ErrorState(this.error);
}

/// Error de usuario no encontrado
class UserNotFound extends ErrorState {
  const UserNotFound() : super("Usuario no encontrado");
}

/// Error general de red
class NetworkError extends ErrorState {
  const NetworkError(String error) : super(error);
}
