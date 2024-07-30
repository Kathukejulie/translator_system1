import 'package:flutter/material.dart';

import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/create_project_instructions.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/sections/sections.dart';
import 'package:translator_app/routes.dart';
import 'package:translator_app/widgets/main.dart';

import 'scaffold_extension.dart';

class CreateNewProjectPageTwo extends StatefulWidget {
  const CreateNewProjectPageTwo({
    super.key,
  });

  @override
  State<CreateNewProjectPageTwo> createState() =>
      _CreateNewProjectPageTwoState();
}

class _CreateNewProjectPageTwoState extends State<CreateNewProjectPageTwo> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldExtension.defaultStyle(
      context: context,
      body: CreateProjectInstructions(),
    );
  }
}
