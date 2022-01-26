import 'package:firebasecludeapp/repo/login_repo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: email,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: pass,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                LoginRepo.emailRegister(pass: pass.text, email: email.text);
              },
              child: Text('Register'),
            ),
            RaisedButton(
              onPressed: () {
                LoginRepo.emailLogin(email: email.text, pass: pass.text);
              },
              child: Text('Login'),
            ),
            RaisedButton(
              onPressed: LoginRepo.currentUser,
              child: Text('Current user'),
            ),
            RaisedButton(
              onPressed: LoginRepo.logOut,
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
