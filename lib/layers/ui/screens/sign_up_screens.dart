// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants/my_color.dart';
import '../widgets/widgets_of_login.dart';
import 'package:flutter/material.dart';

class SignUpScreens extends StatelessWidget {
  const SignUpScreens({super.key});

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
                  'Email',
                  'Enter Your Email..',
                  (email) {
                    emailAddress = email;
                  },
                ),
                SizedBox(height: 10),
                WidgetsOfLogin().buildLoginFiled(
                  'Password',
                  'Enter Your Password..',
                  (password) {
                    passWord = password;
                  },
                ),
                SizedBox(height: 10),
                WidgetsOfLogin().buildLoginFiled(
                  'Confirm Password',
                  'Confirm Password..',
                  (data) {
                    passWord = data;
                  },
                ),
                SizedBox(height: 20),
                WidgetsOfLogin().buildLoginButton(
                  'Sign up',
                  () async {
                    // ignore: unused_local_variable
                    try {
                      final _ = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                            email: emailAddress!,
                            password: passWord!,
                          );
                    } on FirebaseAuthException catch (
                      e
                    ) {
                      if (e.code ==
                          'weak-password') {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          const SnackBar(
                            content: Text(
                              '❌ Password must be at least 6 characters.',
                            ),
                          ),
                        );
                      } else if (e.code ==
                          'email-already-in-use') {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'The account already exists for that email.',
                            ),
                          ),
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
