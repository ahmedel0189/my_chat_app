import '../../../constants/my_color.dart';
import '../../../constants/my_string.dart';
import 'package:flutter/material.dart';

class WidgetsOfLogin {
  Widget buildLogo() {
    return Center(
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
    );
  }

  Widget buildLoginFiled({
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    Function(String)? onChanged,
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged!,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: MyColor.myTextColor,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          color: MyColor.mySecondaryTextColor,
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: MyColor
                .mySecondaryTextColor, // لون البوردر العادي
            width: 2.0,
            // سمك البوردر العادي
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: MyColor
                .mySecondaryTextColor, // لون البوردر وقت الفوكس
            width: 3.0, // سمك البوردر وقت الفوكس
          ),
        ),
      ),
      cursorColor: MyColor.mySecondaryTextColor,
      style: TextStyle(
        color: MyColor.myTextColor,
      ),
    );
  }

  Widget buildLoginButton(
    String buttomText, {
    required VoidCallback? onTap,
  }) {
    return SizedBox(
      width: double
          .infinity, // يخلي الزر بعرض الشاشة
      height: 50, // يخلي الزر أطول شوية
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              MyColor.myTextColor, // لون الخلفية
          foregroundColor:
              MyColor.myblue, // لون النص
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ), // زر مربع
          ),
        ),
        child: Text(buttomText),
      ),
    );
  }

  Widget buildLogInSignUpText(
    BuildContext context,
    String serviceText,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          serviceText == 'Log In'
              ? "Already have an account?"
              : "Don't have an account?",
          style: TextStyle(
            color: MyColor.mySecondaryTextColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            // print("Sign Up Clicked");
            if (serviceText == 'Sign up') {
              Navigator.pushNamed(
                context,
                signUpScreenroute,
              );
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            serviceText,
            style: TextStyle(
              color: MyColor.myHighlightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void buildScaffoldMessenger(
    BuildContext context,
    String textMessage,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(textMessage)),
    );
  }
}
