import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

//import '../user.dart';

final database = openDatabase(
  join(await getDatabasesPath(), 'login_database.db'),
  onCreate: (db, version) {
    return db.execute('CREATE TABLE usuarios('
        'id INTEGER PRIMARY KEY, '
        'email TEXT, '
        'senha TEXT)');
  },
  version: 1,
);
Future<void> save(User user) async {
  await db.insert(
    'user',
    user.toMap(),
    ConflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<User>> users() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('users');
  return List.generate(maps.length, (i) {
    return User(maps[i]['id'], maps[i]['email'], maps[i]['senha']);
  });
}

/*Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'login.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE usuarios('
          'id INTEGER PRIMARY KEY, '
          'email TEXT, '
          'senha TEXT)');
    }, version: 1);
  });
}

Future<int> save(User user) {
  return createDatabase().then((db) {
    final Map<String, dynamic> userMap = Map();
    userMap['id'] = user.id;
    userMap['email'] = user.email;
    userMap['senha'] = user.senha;
    return db.insert('users', userMap);
  });
}

Future<List<User>> findAll() {
  return createDatabase().then((db) {
    return db.query('users').then((maps) {
      final List<User> users = [];
      for (Map<String, dynamic> map in maps) {
        final User user = User(
          map['id'],
          map['email'],
          map['senha'],
        );
        users.add(user);
        return users;
      }
      // return Future.error(
      //    "This is the error", StackTrace.fromString("This is its trace"));
    });
  });
}
*/
class User {
  final int id;
  final String email;
  final String senha;

  User(
    this.id,
    this.email,
    this.senha,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'senha': senha,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, senha: $senha}';
  }
}
