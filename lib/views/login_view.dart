import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _mail;
  late final TextEditingController _pass;

  @override
  void initState() {
    _mail = TextEditingController();
    _pass = TextEditingController();
  }

  @override
  void dispose() {
    _mail.dispose();
    _pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: _mail,
                    decoration: InputDecoration(hintText: 'Account'),
                  ),
                  TextField(
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    controller: _pass,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final mail = _mail.text;
                      final pass = _pass.text;
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: mail, password: pass);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found')
                          print('User not found');
                        else if (e.code == 'wrong-password')
                          print('Wrong password');
                        else
                          print('Some other errors');
                      }
                    },
                    child: const Text('Login'),
                  ),
                  TextButton(onPressed: () {}, child: const Text('Register')),
                ]);
              default:
                return const Text('Loading...');
            }
          },
        ));
  }
}
