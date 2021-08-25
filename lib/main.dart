import 'package:flutter/material.dart';

import 'user.dart';
import './database/app_database.dart';
import 'telas/login.dart';

void main() async {
  runApp(MyApp());
  /*save(User(0, 'eduardo@teste.com', 'jooj123')).then((id) {
    findAll().then((users) => debugPrint(users.toString()));
  });*/
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login', debugShowCheckedModeBanner: false, home: TelaLogin());
  }
}
