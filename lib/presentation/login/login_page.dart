import 'package:flutter/material.dart';
import 'package:gannar_books/presentation/login/login_contract.dart';
import 'package:gannar_books/presentation/login/login_presenter.dart';
import 'package:gannar_books/presentation/login/login_provider.dart';
import 'package:gannar_books/utils/services/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => getIt(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: const LoginContent(),
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});
  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> implements LoginContract {
  // Agrega esta línea
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => getIt(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Consumer<LoginProvider>(
          builder: (context, provider, child) {
            var presenter = LoginPresenter(loginProvider: provider, view: this);

            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      onChanged: presenter.updateUsername,
                      decoration: const InputDecoration(labelText: 'Usuario'),
                      validator: presenter.passwordValidator,
                    ),
                    TextFormField(
                      onChanged: presenter.updatePassword,
                      obscureText: true,
                      decoration:
                          const InputDecoration(labelText: 'Contraseña'),
                      validator: presenter.usernameValidator,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: presenter.login,
                      child: const Text('Iniciar sesión'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void onLoginSuccess() {
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  void onLoginError(String error) {
    // Show error
  }

  @override
  bool isValidLogin() => _formKey.currentState?.validate() ?? false;
}
