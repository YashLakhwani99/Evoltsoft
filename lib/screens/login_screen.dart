// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:evoltsoft/components/my_button.dart';
import 'package:evoltsoft/components/my_textfield.dart';
import 'package:evoltsoft/services/auth/auth_service.dart';
import 'package:evoltsoft/services/auth/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;

  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  
  void login() async {
    final _authService = AuthService();
    try {
      await _authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Icon(
                  CupertinoIcons.battery_charging,
                  size: 100,
                  color: Colors.grey.shade900,
                ),

                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "EVOLTSOFT",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 35,
                ),

                
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),

                const SizedBox(
                  height: 25,
                ),

                
                MyButton(
                  onTap: login,
                  text: "Sign In",
                ),

                const SizedBox(
                  height: 25,
                ),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Colors.grey.shade900,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
