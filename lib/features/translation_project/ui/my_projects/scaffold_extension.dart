import 'package:flutter/material.dart';

import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/sections/sections.dart';
import 'package:translator_app/routes.dart';
import 'package:translator_app/widgets/main.dart';

extension ScaffoldExtension on Scaffold {
  static Scaffold defaultStyle({
    required Widget body,
    required BuildContext context,
  }) =>
      Scaffold(
        backgroundColor: myPrimaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: myPrimaryColor,
          title: customText(
              text: "Request new translation",
              font: 25,
              weight: FontWeight.bold,
              textColor: textColor),
        ),
        body: Container(
            decoration: BoxDecoration(
                color: myPrimaryColor,
                // HexColor("#2d2f35"),
                borderRadius: BorderRadius.circular(0)),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      newProjectSideNav(context),
                      const SizedBox(width: 20),
                      Container(
                          decoration: BoxDecoration(
                              color: mySecondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(16.0),
                          child: body),
                      const SizedBox(width: 20),
                      Center(
                          child: IconButton(
                        onPressed: () =>
                            Navigator.of(context).pushReplacementNamed(home),
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: textColor,
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            )),
      );
}
