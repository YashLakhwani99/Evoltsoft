import 'package:evoltsoft/screens/login_screen.dart';
import 'package:evoltsoft/screens/signup_screen.dart';
import 'package:flutter/material.dart';


class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
 
  bool showLoginPage = true;

 
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(onTap: togglePages);
    } else {
      return SignupScreen(onTap: togglePages);
    }
  }
}
