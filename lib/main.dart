import 'package:a_chat/helpers/app_router.dart';
import 'package:flutter/material.dart';

class AChat extends StatelessWidget {
  final AppRouter appRouter;

  const AChat({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateroute,
    );
  }
}

void main() {
  runApp( AChat(appRouter: AppRouter(),));
}
