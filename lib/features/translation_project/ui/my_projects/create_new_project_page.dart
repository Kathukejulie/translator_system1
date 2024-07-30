import 'package:flutter/material.dart';

import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/create_project_form.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/scaffold_extension.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/sections/sections.dart';
import 'package:translator_app/routes.dart';
import 'package:translator_app/widgets/main.dart';

class CreateNewProjectPage extends StatefulWidget {
  const CreateNewProjectPage({
    super.key,
  });

  @override
  State<CreateNewProjectPage> createState() => _CreateNewProjectPageState();
}

class _CreateNewProjectPageState extends State<CreateNewProjectPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldExtension.defaultStyle(
        context: context,
        body: Container(
            decoration: BoxDecoration(
                color: mySecondaryColor,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(16.0),
            child: CreateProjectFormOne()));
  }
}
