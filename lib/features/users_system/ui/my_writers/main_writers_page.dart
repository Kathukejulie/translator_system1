import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/sections/sidebars.dart';

import 'sections/my_writers_section.dart';

class MainWritersPage extends StatelessWidget {
  const MainWritersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPrimaryColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sidebar(context),
          Expanded(
            child: Container(
              color: myPrimaryColor,
              padding: const EdgeInsets.all(15),
              child: const MyWritersSection(),
            ),
          ),
          // chatSidebar(context),
        ],
      ),
    );
  }
}
