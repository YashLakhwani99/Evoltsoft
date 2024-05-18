// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:evoltsoft/components/my_button.dart';
import 'package:evoltsoft/components/my_textfield.dart';
import 'package:evoltsoft/screens/user_details_screen.dart';
import 'package:evoltsoft/services/auth/auth_service.dart';
import 'package:evoltsoft/services/auth/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  final void Function()? onTap;
  const SignupScreen({super.key, required this.onTap});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
 
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

 
  void register() async {
   
    final _authService = AuthService();
   
    if (passwordController.text == confirmPasswordController.text) {
     
      try {
        await _authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserDetailsScreen(),
          ),
        );
      }
     
      catch (e) {
        showSnackBar(e.toString(), context);
      }
    }
   
    else {
      showSnackBar("Password don't match!!!", context);
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
                  height: 25,
                ),
               
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade900,
                  ),
                ),

                const SizedBox(
                  height: 25,
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
                  height: 10,
                ),

               
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm password",
                  obscureText: false,
                ),

                const SizedBox(
                  height: 25,
                ),

               
                MyButton(onTap: register, text: "Sign Up"),

                const SizedBox(
                  height: 25,
                ),

               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                        "Login here",
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
