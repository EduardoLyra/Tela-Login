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
