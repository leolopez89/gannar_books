abstract class LoginContract {
  bool isValidLogin();

  void onLoginSuccess();

  void onLoginError(String message);
}
