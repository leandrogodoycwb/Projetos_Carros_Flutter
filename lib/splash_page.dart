import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 15),() {
      push(context, LoginPage());
    });
}

  @override
    Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(
      child: CircularProgressIndicator(),
    ),
    );
  }
}