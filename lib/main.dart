import 'package:flutter/material.dart';

import 'package:projeto/database/app_database.dart';
import 'package:projeto/user.dart';
import 'telas/login.dart';

void main() {
  runApp(MyApp());
  save(User(0, 'eduardo@teste.com', 'jooj123')).then((id) {
    findAll().then((users) => debugPrint(users.toString()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login', debugShowCheckedModeBanner: false, home: TelaLogin());
  }
}
