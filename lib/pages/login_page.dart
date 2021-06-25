import 'package:carros/pages/login_api.dart';
import 'package:carros/pages/usuario.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
                "Login",
              "Digite o login",
              controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(
                height: 10,
            ),
            AppText(
              "Senha", "Digite a senha",
              controller: _tSenha,
              password: true,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
                "Login",
              onPressed: _onClickLogin,
            ),
          ],
        ),
      ),
    );
  }

  _text(
      String label,
      String hint, {
        bool password = false,
        required TextEditingController controller,
        FormFieldValidator<String>? validator,
        TextInputType? keyboardType,
        TextInputAction? textInputAction,
        FocusNode? focusNode,
        FocusNode? nextFocus,
      }) {

  }

  _onClickLogin() async{
    if (!_formKey.currentState!.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");
    Usuario user = await LoginApi.login(login, senha);

    if(user != null) {
      print(">>> $user");
      push(context, HomePage());
    } else {
      print("Login incorreto");
    }
  }

  String? _validateLogin(String? text) {
    if (text!.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String? _validateSenha(String? text) {
    if (text!.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A senha precisa ter pelo menos 3 caracteres";
    }
    return null;
  }
}
