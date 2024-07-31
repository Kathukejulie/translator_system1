// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/routes.dart';

class UploadFilesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: mySecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 10),
        child: Center(
          child: TextButton.icon(
            onPressed: () async {
              await newProjectController.uploadFiles();
            },
            icon: Icon(
              Icons.folder_copy_outlined,
              color: textColor,
            ),
            label: Text(
              "Upload files",
              style: TextStyle(color: textColor, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}

class UploadFinalFilesButton extends StatelessWidget {
  final TranslationProjectDataEntity project;

  const UploadFinalFilesButton({super.key, required this.project});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: mySecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 10),
        child: Center(
          child: TextButton.icon(
            onPressed: () async {
              await newProjectController.uploadFinalFiles();
              final newProject = project.copyWith(
                  finalFileUrls: newProjectController.finalFileUrls.value);
              projectsController.updatedata(newProject).then((value) =>
                  Navigator.of(context)
                      .pushReplacementNamed(myProjects, arguments: false));
              newProjectController.finalFileUrls.clear();
            },
            icon: Icon(
              Icons.folder_copy_outlined,
              color: textColor,
            ),
            label: Text(
              "Upload final files",
              style: TextStyle(color: textColor, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
