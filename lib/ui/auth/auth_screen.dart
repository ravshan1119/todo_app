import 'package:flutter/material.dart';
import 'package:todo_app/ui/auth/page/login_page.dart';
import 'package:todo_app/ui/auth/page/sign_up_page.dart';



class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 0,
      ),
        body: isLoginPage
            ? LoginPage(
          onChanged: () {
            setState(() {
              isLoginPage = false;
            });
          },
        )
            : SignUpScreen(
          onChanged: () {
            setState(() {
              isLoginPage = true;
            });
          },
        ));
  }
}