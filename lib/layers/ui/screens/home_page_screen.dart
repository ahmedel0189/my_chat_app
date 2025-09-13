import 'package:a_chat/constants/my_string.dart';
import 'package:a_chat/layers/ui/widgets/custom_appbar.dart';
import 'package:a_chat/layers/ui/widgets/widgets_of_home_page.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appBarTitle: appName),
      body: Column(
        children: [
          Expanded(child: ListView(children: [])),
          WidgetsOfHomePage()
              .buildMassageTextField(),
        ],
      ),
    );
  }
}
