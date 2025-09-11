import '../../../constants/my_color.dart';
import '../widgets/widgets_of_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final controller = TextEditingController();

  LoginScreen({super.key});

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
            WidgetsOfLogin().buildLogo(),
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
              controller: controller,
              labelText: 'Email',
              hintText: 'Enter Your Email..',
              onChanged: (email) {},
            ),
            SizedBox(height: 10),
            WidgetsOfLogin().buildLoginFiled(
              controller: controller,
              labelText: 'Password',
              hintText: 'Enter Your Password..',
              // ignore: non_constant_identifier_names
              onChanged: (Password) {},
            ),
            SizedBox(height: 20),
            WidgetsOfLogin().buildLoginButton(
              'Log in',
              onTap: () {},
            ),
            WidgetsOfLogin().buildLogInSignUpText(
              context,
              'Sign up',
            ),
          ],
        ),
      ),
    );
  }
}
