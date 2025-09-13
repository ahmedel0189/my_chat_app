import 'package:a_chat/constants/my_string.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String appBarTitle;
  const CustomAppbar({
    super.key,
    required this.appBarTitle,
  });
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 4,
      title: Row(
        mainAxisAlignment: MainAxisAlignment
            .center, // 👈 كده يتوسّطوا
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(logiImage, height: 60),
          Text(
            appBarTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
