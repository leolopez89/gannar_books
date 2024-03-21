import 'package:gannar_books/data/dto/user_dto.dart';
import 'package:gannar_books/utils/constants/strings.dart';
import 'package:gannar_books/utils/exceptions/user_not_found_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedCharacterListKey = 'CACHED_CHARACTER_LIST_PAGE';

/// Interfaz para el almancenamiento local de los datos
abstract class LocalStorage {
  /// Guarda los datos del usuario en el almacenamiento local
  Future<bool> saveUser(UserDto user);

  /// Permite recuperar los datos del usuario del almacenamiento local
  Future<UserDto> getLoggedUser();

  /// Verifica si los datos del usuario coinciden con los del almacenamiento
  /// local.
  ///
  /// Se usa para autenticar al usuario
  Future<bool> verifyUser(UserDto user);

  /// Borra los datos del usuario del almacenamiento local
  Future<bool> logout();
}

/// Implementación concreta del almacenamiento de datos locales
class LocalStorageImpl implements LocalStorage {
  /// Mecanismo de almacenamiento: [SharedPreferences]
  final SharedPreferences sharedPreferences;

  LocalStorageImpl({required this.sharedPreferences});

  @override
  Future<bool> saveUser(UserDto user) async {
    final userJsonStr = user.toRawJson();
    return sharedPreferences.setString(SPKeys.userKey, userJsonStr);
  }

  @override
  Future<bool> verifyUser(UserDto user) async {
    final userJsonStr = user.toRawJson();
    final savedUser = sharedPreferences.getString(SPKeys.userKey) ?? "";
    return userJsonStr == savedUser;
  }

  @override
  Future<UserDto> getLoggedUser() async {
    final savedUser = sharedPreferences.getString(SPKeys.userKey) ?? "";
    if (savedUser.isEmpty) throw UserNotFoundException();
    return UserDto.fromRawJson(savedUser);
  }

  @override
  Future<bool> logout() {
    final result = sharedPreferences.remove(SPKeys.userKey);
    return result;
  }
}
