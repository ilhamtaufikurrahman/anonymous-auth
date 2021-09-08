import 'package:authentication_anonymous/auth_services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email', filled: true),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password', filled: true),
            ),
            ElevatedButton(
              child: Text('Anonymous Sign In'),
              onPressed: () async {
                await AuthServices.signInAnonymous();
              },
            ),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () async {
                await AuthServices.signUp(
                    emailController.text, passwordController.text);
              },
            ),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () async {
                await AuthServices.signIn(
                    emailController.text, passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
