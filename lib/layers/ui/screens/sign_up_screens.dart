// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../constants/my_color.dart';
import '../widgets/widgets_of_login.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpScreens extends StatefulWidget {
  const SignUpScreens({super.key});

  @override
  State<SignUpScreens> createState() =>
      _SignUpScreensState();
}

class _SignUpScreensState
    extends State<SignUpScreens> {
  final emailController = TextEditingController();

  final passwordController =
      TextEditingController();

  final confirmPasswordController =
      TextEditingController();
  String? emailAddress;
  String? passWord;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: MyColor.myblue,
        appBar: AppBar(
          backgroundColor: MyColor.myblue,
        ),
        // key: formKey,
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    WidgetsOfLogin().buildLogo(),
                    SizedBox(height: 60),
                    Align(
                      alignment:
                          Alignment.centerLeft,
                      child: Text(
                        'Sign Up',
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
                            emailAddress = email;
                          },
                        ),
                    SizedBox(height: 10),
                    WidgetsOfLogin().buildLoginFiled(
                      controller:
                          passwordController,
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
                      passwordController:
                          passwordController,
                      labelText:
                          'confirm Password',
                      hintText:
                          'Confirm Password..',
                      onChanged: (data) {
                        passWord = data;
                      },
                    ),
                    SizedBox(height: 20),
                    WidgetsOfLogin().buildLoginButton(
                      'Sign up',
                      onTap: () async {
                        if (formKey.currentState!
                            .validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                  email:
                                      emailController
                                          .text
                                          .trim(),
                                  password:
                                      passwordController
                                          .text
                                          .trim(),
                                );
                            WidgetsOfLogin()
                                .buildScaffoldMessenger(
                                  context,
                                  '✅ Account created successfully',
                                );
                          } on FirebaseAuthException catch (
                            e
                          ) {
                            if (e.code ==
                                'weak-password') {
                              WidgetsOfLogin()
                                  .buildScaffoldMessenger(
                                    context,
                                    '❌ Password must be at least 6 characters.',
                                  );
                            } else if (e.code ==
                                'email-already-in-use') {
                              WidgetsOfLogin()
                                  .buildScaffoldMessenger(
                                    context,
                                    '⚠️ The account already exists for that email.',
                                  );
                            }
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
                          'Log In',
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
