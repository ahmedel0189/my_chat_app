import 'package:a_chat/layers/ui/screens/home_page_screen.dart';

import '../constants/my_string.dart';
import '../layers/ui/screens/login_screen.dart';
import '../layers/ui/screens/sign_up_screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // ignore: body_might_complete_normally_nullable
  Route? generateroute(RouteSettings setting) {
    switch (setting.name) {
      case loginScreenroute:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case signUpScreenroute:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreens(),
        );
      case homePageroute:
        return MaterialPageRoute(
          builder: (_) => const HomePageScreen(),
        );
    }
  }
}
