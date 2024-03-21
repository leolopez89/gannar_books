import 'package:flutter/foundation.dart';
import 'package:gannar_books/domain/models/user.dart';
import 'package:gannar_books/domain/repositories/users_repository.dart';

class LoginProvider with ChangeNotifier {
  final UsersRepository usersRepository;

  User user = User.empty();
  String _error = "";
  bool _isAuthenticated = false;

  bool _showLogin = true;

  LoginProvider(this.usersRepository);

  String get username => user.username;
  String get password => user.password;

  String get error => _error;
  bool get hasError => error.isNotEmpty;

  bool get isAuthenticated => _isAuthenticated;

  bool get showLogin => _showLogin;

  set showLogin(bool val) {
    _showLogin = val;
    notifyListeners();
  }

  set isAuthenticated(bool val) {
    _isAuthenticated = val;
    notifyListeners();
  }

  set error(String text) {
    _error = text;
    notifyListeners();
  }

  void updateUsername(String username) {
    user.username = username;
    notifyListeners();
  }

  void updatePassword(String password) {
    user.password = password;
    notifyListeners();
  }

  Future<void> login() async {
    final result = await usersRepository.verifyUser(user);
    result.fold((l) => error = l.error, (r) => isAuthenticated = r);
  }

  Future<void> createUser() async {
    final result = await usersRepository.createUser(user);
    result.fold((l) => error = l.error, (r) => isAuthenticated = r);
  }
}
