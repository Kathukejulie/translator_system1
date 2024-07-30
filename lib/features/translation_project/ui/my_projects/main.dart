import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/sections/my_projects.dart';
import 'package:translator_app/sections/sidebars.dart';
import 'package:flutter/material.dart';

class MainOrdersPage extends StatelessWidget {
  final bool status;
  const MainOrdersPage({
    Key? key,
    required this.status,
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
              child: MyProjectsSection(
                status: status,
              ),
            ),
          ),
          // chatSidebar(context),
        ],
      ),
    );
  }
}
