import 'package:a_chat/constants/my_string.dart';
import 'package:a_chat/layers/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // ignore: body_might_complete_normally_nullable
  Route? generateroute(RouteSettings setting) {
    switch (setting.name) {
      case loginScreenroute:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
    }
  }
}
