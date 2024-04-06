import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPgae extends StatefulWidget {
  final VoidCallback loginPage;
  const RegistrationPgae({super.key, required this.loginPage});

  @override
  State<RegistrationPgae> createState() => _RegistrationPgaeState();
}

class _RegistrationPgaeState extends State<RegistrationPgae> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signUp() async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    UserCredential uc = await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
    print(uc.user!.uid);
    print("user created");
    // do stuff with uc.user.uid
    // do stuff with uc.user.uid
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
      ),
      body: ListView(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'R E G I S T R A T I O N',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              ),
              Text(
                'D E T A I L',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(9)),
                    child: Center(
                        child: Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah punya akun ? '),
                  GestureDetector(
                    onTap: widget.loginPage,
                    child: Text(
                      'Login disini',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
