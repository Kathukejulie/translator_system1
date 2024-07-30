import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/routes.dart';
import 'package:translator_app/widgets/main.dart';

Column newProjectSideNav(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextButton.icon(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(createNewProject),
            icon: const Icon(Icons.circle),
            label: customText(
                text: "Details",
                font: 14,
                weight: FontWeight.bold,
                textColor: textColor),
          )),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextButton.icon(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(createNewProjectPageTwo),
            icon: const Icon(Icons.circle),
            label: customText(
                text: "Instructions",
                font: 14,
                weight: FontWeight.bold,
                textColor: textColor),
          )),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextButton.icon(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(createNewProjectPageThree),
            icon: const Icon(Icons.circle),
            label: customText(
                text: "Select Translator",
                font: 14,
                weight: FontWeight.bold,
                textColor: textColor),
          )),
    ],
  );
}
