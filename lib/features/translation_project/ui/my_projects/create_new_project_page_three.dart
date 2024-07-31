import 'package:flutter/material.dart';

import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/scaffold_extension.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/sections/sections.dart';
import 'package:translator_app/features/translation_project/controllers/new_project_controller.dart';
import 'package:translator_app/routes.dart';
import 'package:translator_app/features/users_system/domain/entities/user.dart';
import 'package:translator_app/widgets/main.dart';

class CreateNewProjectPageThree extends StatefulWidget {
  const CreateNewProjectPageThree({
    super.key,
  });

  @override
  State<CreateNewProjectPageThree> createState() =>
      _CreateNewProjectPageThreeState();
}

class _CreateNewProjectPageThreeState extends State<CreateNewProjectPageThree> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldExtension.defaultStyle(
      context: context,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          selectUsersColumn(context),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              projectsController.create(newProjectController.order()).then(
                  (value) => Navigator.of(context).pushReplacementNamed(home));
              contractsController.create(newContractController.order());
              newProjectController.fileUrls.clear();
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }

  StreamBuilder selectUsersColumn(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
        stream: usersController.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;

            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: users
                    .where((element) => element["isWriter"] == true)
                    .map((e) =>
                        selectUserCard(context, UserDataEntity.fromJson(e)))
                    .toList());
          } else {
            return Container();
          }
        });
  }

  SizedBox selectUserCard(BuildContext context, UserDataEntity e) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: myPrimaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, mainprojectDetails),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: mySecondaryColor,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: customText(
                                text: e.fullName,
                                font: 12,
                                weight: FontWeight.w400,
                                textColor: textColor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 4.0, top: 4),
                              child: customText(
                                text: e.email,
                                font: 12,
                                weight: FontWeight.w400,
                                textColor: textColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: customText(
                                text: e.expertiseLanguage,
                                font: 12,
                                weight: FontWeight.w400,
                                textColor: alttextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder(
                      stream: selectedUserController.selectedTranslatorStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final userId = snapshot.data!;
                          return TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      userId.isNotEmpty && userId == e.id
                                          ? Colors.red
                                          : Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () {
                                selectedUserController.saveUser(e.id);
                                newProjectController.userId.value = e.id;
                                newProjectController.userName.value =
                                    e.fullName;
                                newContractController.writerId.value = e.id;
                              },
                              child: customText(
                                  text: userId.isNotEmpty && userId == e.id
                                      ? "Selected"
                                      : "Select Translator",
                                  font: 14,
                                  weight: FontWeight.w400,
                                  textColor: textColor));
                        } else {
                          return customText(
                              text: "fetching...",
                              font: 12,
                              weight: FontWeight.bold,
                              textColor: textColor);
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
