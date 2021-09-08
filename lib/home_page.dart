import 'package:authentication_anonymous/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User? user;
  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user!.uid),
            ElevatedButton(
                onPressed: () async {
                  await AuthServices.signOut();
                },
                child: Text('Log Out'))
          ],
        ),
      ),
    );
  }
}
