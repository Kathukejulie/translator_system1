import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/contracts/ui/contract_details/sections/reusables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectBidSection extends StatefulWidget {
  final TranslationProjectDataEntity project;

  const ProjectBidSection({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectBidSectionState createState() => _ProjectBidSectionState();
}

class _ProjectBidSectionState extends State<ProjectBidSection> {
  @override
  void initState() {
    // TODO: implement initState
    _showCloseButton = !widget.project.isComplete;
    super.initState();
  }

  bool _showCloseButton = true;

  void _closeproject() async {
    setState(() {
      _showCloseButton = false;
    });
    await projectsController.closeProject(widget.project.id);
    await contractsController.closeContract(widget.project.id);
    // Optionally, you can set _showCloseButton back to true if the closing fails
    // or if you want to allow multiple attempts to close the project
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
        color: mySecondaryColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Price KES ${widget.project.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: textColor,
                    fontSize: 15,
                  ),
                ),
                // Icon(
                //   FontAwesomeIcons.ellipsisV,
                //   color: inactiveLinkTextColor,
                //   size: 15,
                // ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_showCloseButton)
                  MaterialButton(
                    color: Colors.red,
                    onPressed: _closeproject,
                    child: Text(
                      "Close Project",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget customerSummaryCard(BuildContext context) {
//   return Expanded(
//     child: Container(
//       margin: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 10),
//       color: mySecondaryColor,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: CircleAvatar(
//                       radius:
//                           ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
//                               ? 15
//                               : 20,
//                       backgroundColor: Colors.grey,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "526551",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: textColor,
//                               fontSize: ResponsiveWrapper.of(context)
//                                       .isSmallerThan(DESKTOP)
//                                   ? 10
//                                   : 12,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             "English US",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey.shade700,
//                               fontSize: ResponsiveWrapper.of(context)
//                                       .isSmallerThan(DESKTOP)
//                                   ? 10
//                                   : 11.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "100%",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: textColor,
//                           fontSize: ResponsiveWrapper.of(context)
//                                   .isSmallerThan(DESKTOP)
//                               ? 10
//                               : 12,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "Acceptance rate",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w200,
//                           color: Colors.grey.shade500,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Text(
//                         "89%",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: textColor,
//                           fontSize: ResponsiveWrapper.of(context)
//                                   .isSmallerThan(DESKTOP)
//                               ? 10
//                               : 12,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "Pay rate",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w200,
//                           color: Colors.grey.shade500,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Text(
//                         "180",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: textColor,
//                           fontSize: ResponsiveWrapper.of(context)
//                                   .isSmallerThan(DESKTOP)
//                               ? 10
//                               : 12,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "Projects",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w200,
//                           color: Colors.grey.shade500,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "3:39 AM",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: textColor,
//                           fontSize: ResponsiveWrapper.of(context)
//                                   .isSmallerThan(DESKTOP)
//                               ? 10
//                               : 12,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "Customer local time",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w200,
//                           color: Colors.grey.shade500,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget uploadFilesCard(BuildContext context,
    {required TranslationProjectDataEntity project}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 10),
      color: mySecondaryColor,
      child: Center(
          child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.folder_copy_outlined,
              ),
              label: const Text("Upload files"))),
    ),
  );
}

Widget chatWithClientCard(BuildContext context) {
  return Flexible(
    child: Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 35 : 55,
      color: mySecondaryColor,
      child: Center(
        child: Text(
          "Chat is not available at the moment",
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: inactiveLinkTextColor,
            fontSize: 10,
          ),
        ),
      ),
    ),
  );
}

Widget projectSummaryCard(BuildContext context,
    {required TranslationProjectDataEntity project}) {
  return Container(
    color: mySecondaryColor,
    padding: const EdgeInsets.all(10.0),
    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    authenticationController.loggedInUser.value!.isWriter ==
                            true
                        ? projectSummaryCardSubjectAndTopicsRow(context,
                            "Project manager:", project.projectManagerName)
                        : projectSummaryCardSubjectAndTopicsRow(
                            context, "Assigned to:", project.writerName),
                    Divider(color: dividerColor),
                    projectSummaryCardSubjectAndTopicsRow(
                        context, "Task:", project.task),
                    Divider(color: dividerColor),
                    projectSummaryCardSubjectAndTopicsRow(
                        context,
                        "Pages/words:",
                        "${project.words} words (Double spacing)"),
                    Divider(color: dividerColor),
                    projectSummaryCardSubjectAndTopicsRow(
                        context,
                        "Min. price:",
                        "KES ${project.price.toStringAsFixed(2)}"),
                    Divider(color: dividerColor),
                    projectSummaryCardSubjectAndTopicsRow(
                        context, "Current Language:", project.currentLanguage),
                    Divider(color: dividerColor),
                  ],
                ),
              ),
            ),
            // const SizedBox(width: 20, height: double.infinity),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // physics: const NeverScrollableScrollPhysics(),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    projectSummaryCardSubjectAndTopicsRow(
                        context, " Service:", project.service),
                    Divider(color: dividerColor),
                    projectSummaryCardSubjectAndTopicsRow(
                        context, "Education Level:", "N/A"),
                    Divider(color: dividerColor),
                    projectSummaryCardSubjectAndTopicsRow(
                        context, "Subject:", project.subject),
                    Divider(color: dividerColor),
                    projectSummaryCardSubjectAndTopicsRow(context,
                        "Your Deadline:", formatter.format(project.deadline)),
                    Divider(color: dividerColor),
                    projectSummaryCardSubjectAndTopicsRow(
                        context, "Final Language:", project.finalLanguage),
                    Divider(color: dividerColor),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Attached files: ${project.fileUrls.length}",
                  style: TextStyle(
                    fontSize: 11,
                    color: inactiveLinkTextColor,
                  ),
                ),
                // const Text(
                //   "View files",
                //   style: TextStyle(
                //     fontSize: 11,
                //     color: Colors.blue,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Divider(color: dividerColor),
        ListView.builder(
          shrinkWrap:
              true, // Important to make ListView.builder work inside a Column
          physics: const NeverScrollableScrollPhysics(),
          itemCount: project.fileUrls.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                'File ${index + 1}',
                style: TextStyle(
                  fontSize: 11,
                  color: inactiveLinkTextColor,
                ),
              ),
              // subtitle: Text(project.fileUrls[index]),
              trailing: IconButton(
                icon: const Icon(
                  Icons.download,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  // Handle file download
                  final url = project.fileUrls[index];
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            );
          },
        ),
        Divider(color: dividerColor),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Description",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            project.description,
            textAlign: TextAlign.left,
            strutStyle: const StrutStyle(
              height: 1.5,
            ),
            style: TextStyle(
              color: textColor.withOpacity(0.8),
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
