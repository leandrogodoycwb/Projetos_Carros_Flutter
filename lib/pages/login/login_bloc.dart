
import 'dart:async';

import 'package:carros/firebase/firebase_service.dart';
import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/simple_bloc.dart';

class LoginBloc extends BooleanBloc {

  Future<ApiResponse> login(String login, String senha) async {

    add(true);

   //ApiResponse response = await LoginApi.login(login, senha);
    ApiResponse response = await FirebaseService().login(login, senha);

    add(false);

    return response;
  }
}