import 'package:flutter/material.dart';
import 'package:modul4_task/app/modules/home/views/home_view.dart';
import 'package:modul4_task/app/modules/home/views/registration.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      // Perbaiki pemanggilan setState()
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(registerPage: toggleScreen);
    } else {
      return RegistrationPgae(
        loginPage: toggleScreen,
      );
    }
  }
}
