import 'package:flutter/material.dart';
import 'package:random_flutter_practice/app_firat_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Practice',
      home: AppFirstPage(),
    );
  }
}
