import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageLogin extends StatefulWidget {
  const HomePageLogin({super.key});

  @override
  State<HomePageLogin> createState() => _HomePageLoginState();
}

class _HomePageLoginState extends State<HomePageLogin> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign In as '),
            Text(user!.email!),
            MaterialButton(
              color: Colors.grey,
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}
