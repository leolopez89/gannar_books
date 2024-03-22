import 'package:gannar_books/presentation/login/login_contract.dart';
import 'package:gannar_books/presentation/login/login_provider.dart';

class LoginPresenter {
  final LoginProvider loginProvider;

  final LoginContract view;

  LoginPresenter({required this.loginProvider, required this.view});

  void updateUsername(String username) {
    loginProvider.updateUsername(username);
  }

  void updatePassword(String password) {
    loginProvider.updatePassword(password);
  }

  String? usernameValidator(String? value) =>
      ((value ?? "").isEmpty) ? 'Ususario requerido' : null;

  String? passwordValidator(String? value) {
    if ((value ?? "").isEmpty) {
      return 'Por favor ingresa tu contraseña';
    }
    if (value!.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  Future<void> login() async {
    if (!view.verifyLoginData()) return;

    await loginProvider.createUser();
    await loginProvider.login();
    if (loginProvider.isAuthenticated) {
      view.finishLogin();
    } else {
      view.showError(loginProvider.error);
    }
  }
}
