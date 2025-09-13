// ignore_for_file: use_build_context_synchronously

import 'package:a_chat/constants/my_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../constants/my_color.dart';
import '../widgets/widgets_of_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  final emailController = TextEditingController();
  String? emailAddress;
  String? passWord;

  final passwordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: MyColor.myblue,
        body: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              // children: [
              child: Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center, // رأسي
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                    WidgetsOfLogin().buildLogo(),
                    SizedBox(height: 60),
                    Align(
                      alignment:
                          Alignment.centerLeft,
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color:
                              MyColor.myTextColor,
                          fontSize: 25,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    WidgetsOfLogin()
                        .buildLoginFiled(
                          controller:
                              emailController,
                          labelText: 'Email',
                          hintText:
                              'Enter Your Email..',
                          onChanged: (email) {
                            emailAddress =
                                emailController
                                    .text;
                          },
                        ),
                    SizedBox(height: 10),
                    WidgetsOfLogin().buildLoginFiled(
                      controller:
                          passwordController,
                      labelText: 'Password',
                      hintText:
                          'Enter Your Password..',
                      // ignore: non_constant_identifier_names
                      onChanged: (Password) {
                        passWord =
                            passwordController
                                .text;
                      },
                    ),
                    SizedBox(height: 20),
                    WidgetsOfLogin().buildLoginButton(
                      'Log in',
                      onTap: () async {
                        if (formKey.currentState!
                            .validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                  email:
                                      emailController
                                          .text
                                          .trim(),
                                  password:
                                      passwordController
                                          .text
                                          .trim(),
                                );
                            if (!mounted) return;
                            await Future.delayed(
                              const Duration(
                                seconds: 1,
                              ),
                            );
                            WidgetsOfLogin()
                                .buildScaffoldMessenger(
                                  context,
                                  '✅ Account log in successfully',
                                );
                            if (!mounted) return;
                            Navigator.pushNamed(
                              context,
                              homePageroute,
                            );
                          } on FirebaseAuthException catch (
                            e
                          ) {
                            if (!mounted) return;
                            String errorMessage;
                            switch (e.code) {
                              case 'user-not-found':
                                errorMessage =
                                    '❌ No user found for that email.';
                                break;
                              case 'wrong-password':
                                errorMessage =
                                    '❌ Incorrect password.'; // 👈 دي الحالة اللي مستنيها
                                break;
                              case 'invalid-email':
                                errorMessage =
                                    '⚠️ Please enter a valid email address.';
                                break;
                              case 'user-disabled':
                                errorMessage =
                                    '⚠️ This account has been disabled.';
                                break;
                              default:
                                errorMessage =
                                    '⚠️ ${e.message}';
                            }
                            WidgetsOfLogin()
                                .buildScaffoldMessenger(
                                  context,
                                  errorMessage,
                                );
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                    WidgetsOfLogin()
                        .buildLogInSignUpText(
                          context,
                          'Sign up',
                        ),
                  ],
                ),
              ),
              // ],
            ),
          ),
        ),
      ),
    );
  }
}
