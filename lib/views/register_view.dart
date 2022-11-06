import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        appBar: AppBar(title: Text("Register")),
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
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                            email: mail, password: pass);
                      } on FirebaseAuthException catch (e) {
                        switch(e.code){
                          case 'weak-password':
                            print('Weak password');
                            break;
                          case 'email-already-in-use':
                            print('Used email');
                            break;
                          case 'invalid-email':
                            print('Invalid email');
                            break;
                          default:
                            print('Other errors');
                        }
                      }
                    },
                    child: const Text('Register'),
                  ),
                ]);
              default:
                return const Text('Loading...');
            }
          },
        ));
  }
}