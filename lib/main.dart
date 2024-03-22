import 'package:flutter/material.dart';
import 'package:gannar_books/data/datasources/local/local_storage.dart';
import 'package:gannar_books/presentation/home/home_page.dart';
import 'package:gannar_books/presentation/login/login_page.dart';
import 'package:gannar_books/utils/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();

  bool isLogged = getIt<LocalStorage>().isLogged();

  runApp(GannarBooks(isLogged));
}

class GannarBooks extends StatelessWidget {
  const GannarBooks(this.isLogged, {super.key});

  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        // '/details': (context) => DetailsPage(book: null),
        // '/search': (context) => SearchPage(query: ''),
      },
      initialRoute: isLogged ? '/' : '/login',
      theme: ThemeData(fontFamily: "Askan"),
    );
  }
}
