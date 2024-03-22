abstract class LoginContract {
  bool verifyLoginData();

  void finishLogin();

  void showError(String message);
}
