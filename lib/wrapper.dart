import 'package:authentication_anonymous/home_page.dart';
import 'package:authentication_anonymous/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    return (user == null)
        ? LoginPage()
        : HomePage(
            user: user,
          );
  }
}
