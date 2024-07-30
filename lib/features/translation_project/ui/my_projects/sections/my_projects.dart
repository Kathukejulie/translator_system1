import 'package:get/get.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/widgets/main.dart';
import 'package:translator_app/features/users_system/extensions/main.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

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
                              .where(
                                  (element) => element['isComplete'] == status)
                              .map((e) => projectTableRow(
                                  context: context,
                                  order:
                                      TranslationProjectDataEntity.fromJson(e)))
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final projects = await projectsController
              .getAll(); // Ensure your controller has this method

          // Determine which method to use
          List<Map<String, dynamic>> filteredProjects;
          if (authenticationController.loggedInUser.value!.isWriter) {
            filteredProjects = projects.whereAssignedToUser().toList();
          } else {
            filteredProjects = projects.whereBelongsToUser().toList();
          }
          final projectEntities = filteredProjects
              .map((e) => TranslationProjectDataEntity.fromJson(e))
              .toList();
          await _generatePdf(projectEntities);
        },
        child: Icon(Icons.print),
        backgroundColor: Colors.blue,
      ),
    );
  }

  // Generate PDF
  Future<void> _generatePdf(List<TranslationProjectDataEntity> projects) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Table.fromTextArray(
            headers: ['Title', 'Translator', 'Price', 'Word Count'],
            data: projects.map((project) {
              return [
                project.title,
                project.writerName,
                project.price.toString(),
                project.words.toString(),
              ];
            }).toList(),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
