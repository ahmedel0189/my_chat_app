import 'package:a_chat/constants/my_color.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myblue,
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/scholar.png',
          ),
          
        ],
      ),
    );
  }
}
