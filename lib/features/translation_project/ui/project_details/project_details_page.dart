import 'dart:math';

import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/contracts/ui/contract_details/sections/sections.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/features/translation_project/ui/project_details/sections/sections.dart';
import 'package:translator_app/routes.dart';

class ProjectDetailsPage extends StatefulWidget {
  final TranslationProjectDataEntity project;
  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          alignment: Alignment.centerLeft,
          height: 70,
          child: Text(
            "Project ${Random().nextInt(9999999)}",
            style: TextStyle(
              color: textColor,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(8),
          color: mySecondaryColor,
          height: 60,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // tileColor: mySecondaryColor,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            widget.project.title.toUpperCase(),
                            style: TextStyle(
                              color: textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                formatter.format(widget.project.deadline),
                                style: TextStyle(
                                  color: inactiveLinkTextColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Flexible(
                              child: Text(
                                "",
                                style: TextStyle(
                                  color: deadlineTimeColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Icon(
                //   FontAwesomeIcons.ellipsisV,
                //   size: 15,
                //   color: textColor,
                // ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: ResponsiveWrapper.of(context).isDesktop
              ? 160
              : ResponsiveWrapper.of(context).isTablet
                  ? 150
                  : 300,
          child: ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.start,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnMainAxisAlignment: MainAxisAlignment.start,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                  child: ProjectBidSection(project: widget.project)),
              // ResponsiveRowColumnItem(
              //   child: uploadFilesCard(context, project: project),
              // ),
            ],
          ),
        ),
        projectSummaryCard(context, project: widget.project),
      ],
    );
  }
}
