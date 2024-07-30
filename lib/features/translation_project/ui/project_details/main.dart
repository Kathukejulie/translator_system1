import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/features/translation_project/ui/project_details/project_details_page.dart';
import 'package:translator_app/sections/sidebars.dart';
import 'package:flutter/material.dart';

class MainProjectDetailsPage extends StatelessWidget {
  final TranslationProjectDataEntity project;
  const MainProjectDetailsPage({Key? key, required this.project})
      : super(key: key);

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
            child: ProjectDetailsPage(project: project),
          ),
          // chatSidebar(context),
        ],
      ),
    );
  }
}
