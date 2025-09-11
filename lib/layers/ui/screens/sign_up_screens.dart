// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants/my_color.dart';
import '../widgets/widgets_of_login.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpScreens extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController =
      TextEditingController();
  final confirmPasswordController =
      TextEditingController();
  WidgetsOfLogin? widgetsOfLogin;
  SignUpScreens({super.key, this.widgetsOfLogin});

  @override
  Widget build(BuildContext context) {
    String? emailAddress;
    String? passWord;
    return Scaffold(
      backgroundColor: MyColor.myblue,
      appBar: AppBar(
        backgroundColor: MyColor.myblue,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                WidgetsOfLogin().buildLogo(),
                SizedBox(height: 60),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: MyColor.myTextColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                WidgetsOfLogin().buildLoginFiled(
                  controller: emailController,
                  labelText: 'Email',
                  hintText: 'Enter Your Email..',
                  onChanged: (email) {
                    emailAddress = email;
                  },
                ),
                SizedBox(height: 10),
                WidgetsOfLogin().buildLoginFiled(
                  controller: passwordController,
                  labelText: 'Password',
                  hintText:
                      'Enter Your Password..',
                  onChanged: (password) {
                    passWord = password;
                  },
                ),
                SizedBox(height: 10),
                WidgetsOfLogin().buildLoginFiled(
                  controller:
                      confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password..',
                  onChanged: (data) {
                    passWord = data;
                  },
                ),
                SizedBox(height: 20),
                WidgetsOfLogin().buildLoginButton(
                  'Sign up',
                  onTap: () async {
                    // ignore: unused_local_variable
                    try {
                      final _ = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                            email: emailAddress!,
                            password: passWord!,
                          );
                      if (passwordController
                          .text
                          .isEmpty) {
                        widgetsOfLogin!
                            .buildScaffoldMessenger(
                              context,
                              '⚠️ Please enter a password',
                            );
                        return;
                      }
                      if (confirmPasswordController
                          .text
                          .isEmpty) {
                        widgetsOfLogin!
                            .buildScaffoldMessenger(
                              context,
                              '⚠️ Please confirm the password',
                            );
                        return;
                      }
                    } on FirebaseAuthException catch (
                      e
                    ) {
                      if (e.code ==
                          'weak-password') {
                        widgetsOfLogin!
                            .buildScaffoldMessenger(
                              context,
                              '❌ Password must be at least 6 characters.',
                            );
                      } else if (e.code ==
                          'email-already-in-use') {
                        widgetsOfLogin!
                            .buildScaffoldMessenger(
                              context,
                              'The account already exists for that email.',
                            );
                      }
                    }
                  },
                ),
                WidgetsOfLogin()
                    .buildLogInSignUpText(
                      context,
                      'Log In',
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
