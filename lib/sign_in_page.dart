import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Singn In'),) ,
      body: Center(child: ElevatedButton(child: Text('Sign In'),onPressed: () async {
        try {
          await FirebaseAuth.instance.signInAnonymously();
        } catch (e) {
          print(e);
        }
      },),),
    );
  }
}
