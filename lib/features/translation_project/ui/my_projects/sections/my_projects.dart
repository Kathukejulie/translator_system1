import 'package:get/get.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/widgets/main.dart';
import 'package:translator_app/features/users_system/extensions/main.dart';

class MyProjectsSection extends StatelessWidget {
  final bool status;

  const MyProjectsSection({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: myPrimaryColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Text(
            authenticationController.loggedInUser.value!.isWriter
                ? "My Tasks"
                : "Translations",
            style: TextStyle(
              color: textColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Scaffold(
          backgroundColor: myPrimaryColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: myPrimaryColor,
            elevation: 0,
          ),
          body: StreamBuilder(
            stream: projectsController.streamAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final projects = snapshot.data!;
                if (authenticationController.loggedInUser.value!.isWriter ==
                    true) {
                  return ListView(
                      children: projects
                          .whereAssignedToUser()
                          .where((element) => element['isComplete'] == status)
                          .map((e) => projectTileCard(
                              context: context,
                              order: TranslationProjectDataEntity.fromJson(e)))
                          .toList());
                } else {
                  return Column(
                    children: [
                      projectTableTitleRow(),
                      Table(
                          children: projects
                              .whereBelongsToUser()
                              .where((element) => element['isComplete'] == status)
                              .map((e) => projectTableRow(
                                  context: context,
                                  order: TranslationProjectDataEntity.fromJson(e)))
                              .toList()),
                    ],
                  );
                }
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
