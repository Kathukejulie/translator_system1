import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/main_intro_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPrimaryColor,
      body: const MainIntroPage(),
    );
  }
}
