
class Usuario {
  String login;
  String nome;
  String email;
  String token;

  Usuario.FromJson(Map<dynamic, dynamic> map) :
    login = map ["login"],
    nome = map ["nome"],
    email = map ["email"],
    token = map ["token"];


  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token}';
  }
}