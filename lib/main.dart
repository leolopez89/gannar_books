import 'package:flutter/material.dart';
import 'package:gannar_books/utils/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();
  runApp(const GannarBooks());
}

class GannarBooks extends StatelessWidget {
  const GannarBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Gannar Books App Bar')),
        body: const Center(child: Text('Gannar Books', key: Key("title"))),
      ),
    );
  }
}
