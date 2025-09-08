import 'package:a_chat/constants/my_color.dart';
import 'package:a_chat/layers/ui/widgets/widgets_of_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myblue,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          // crossAxisAlignment:
          //     CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                  ),
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      color: MyColor.myTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Log in',
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
            SizedBox(height: 20),
            WidgetsOfLogin().buildLoginButton(),
            WidgetsOfLogin().buildSignUpText(),
          ],
        ),
      ),
    );
  }
}
