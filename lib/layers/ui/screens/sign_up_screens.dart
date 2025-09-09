import 'package:a_chat/constants/my_color.dart';
import 'package:a_chat/layers/ui/widgets/widgets_of_login.dart';
import 'package:flutter/material.dart';

class SignUpScreens extends StatelessWidget {
  const SignUpScreens({super.key});

  @override
  Widget build(BuildContext context) {
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
              // crossAxisAlignment:
              //     CrossAxisAlignment.center,
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
                ),
                SizedBox(height: 10),
                WidgetsOfLogin().buildLoginFiled(
                  'Password',
                  'Enter Your Password..',
                ),
                SizedBox(height: 10),
                WidgetsOfLogin().buildLoginFiled(
                  'Confirm Password',
                  'Confirm Password..',
                ),
                SizedBox(height: 20),
                WidgetsOfLogin().buildLoginButton(
                  'Sign up',
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
