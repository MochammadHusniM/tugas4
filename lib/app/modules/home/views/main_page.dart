import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modul4_task/app/modules/home/controllers/auth.dart';
import 'package:modul4_task/app/modules/home/views/main_home.dart';
import 'package:modul4_task/app/modules/home/views/home_view.dart';
import 'package:modul4_task/app/modules/home/views/registration.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePageLogin();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
