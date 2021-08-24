import 'package:flutter/material.dart';
import 'telas/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login', debugShowCheckedModeBanner: false, home: TelaLogin());
  }
}
