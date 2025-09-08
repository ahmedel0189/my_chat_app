import 'package:a_chat/constants/my_color.dart';
import 'package:flutter/material.dart';

class WidgetsOfLogin {
  Widget buildLoginFiled(
    String labelText,
    String hintText,
  ) {
    return TextField(
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

  Widget buildLoginButton() {
    return SizedBox(
      width: double
          .infinity, // يخلي الزر بعرض الشاشة
      height: 50, // يخلي الزر أطول شوية
      child: ElevatedButton(
        onPressed: () {
          // هنا هتكتب الأكشن بتاع تسجيل الدخول
          // print("Login Pressed");
        },
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
        child: Text("Login"),
      ),
    );
  }

  Widget buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "don't have an account ",
          style: TextStyle(
            color: MyColor.mySecondaryTextColor,
          ),
        ),
        InkWell(
          onTap: () {
            // print("Sign Up Clicked");
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: MyColor.myHighlightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
