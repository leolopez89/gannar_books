import 'package:flutter/material.dart';
import 'package:gannar_books/presentation/home/home_page.dart';
import 'package:gannar_books/presentation/login/login_contract.dart';
import 'package:gannar_books/presentation/login/login_presenter.dart';
import 'package:gannar_books/presentation/login/login_provider.dart';
import 'package:gannar_books/utils/constants/strings.dart';
import 'package:gannar_books/utils/constants/styles.dart';
import 'package:gannar_books/utils/services/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(getIt()),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const Scaffold(body: LoginContent()),
        ));
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});
  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> implements LoginContract {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        var presenter = LoginPresenter(loginProvider: provider, view: this);

        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Image.asset(
                      ImageAssets.imgLoginBooks,
                      fit: BoxFit.cover,
                      width: size.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white.withOpacity(0)],
                          stops: const [0.01, 1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      width: size.width,
                      height: 200,
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                padding: const EdgeInsets.only(left: 24, top: 16, right: 24),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bienvenido a",
                        style: AppStyle.semiBoldAskan20,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gannar Books",
                        key: const Key('title'),
                        style: AppStyle.semiBoldAskan40,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      key: const Key('username'),
                      onChanged: presenter.updateUsername,
                      decoration: appInputDecoration(
                        labelText: "Usuario",
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColors.baseColor,
                        ),
                      ),
                      validator: presenter.usernameValidator,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      key: const Key('password'),
                      onChanged: presenter.updatePassword,
                      obscureText: true,
                      decoration: appInputDecoration(
                        labelText: "Contraseña",
                        prefixIcon: const Icon(
                          Icons.key,
                          color: AppColors.baseColor,
                        ),
                      ),
                      validator: presenter.passwordValidator,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => presenter.login(),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      key: const Key('loginbtn'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          backgroundColor: AppColors.baseColor,
                          fixedSize: const Size(150, 40)),
                      onPressed: presenter.login,
                      child: Text(
                        'Iniciar sesión',
                        style: AppStyle.regularAskan17,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void onLoginSuccess() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  void onLoginError(String error) {
    final snackBar = SnackBar(
      content: Text(error),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  bool isValidLogin() => _formKey.currentState?.validate() ?? false;
}
