import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/sections/sidebars.dart';

import 'main_entry_middle_section.dart';

class MainIntroPage extends StatelessWidget {
  const MainIntroPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPrimaryColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          sidebar(context),
          Expanded(
            child: Container(
              color: myPrimaryColor,
              padding: const EdgeInsets.all(15),
              child: Center(child: MainEntryMiddleSection()),
            ),
          ),
          // chatSidebar(context),
        ],
      ),
    );
  }
}
