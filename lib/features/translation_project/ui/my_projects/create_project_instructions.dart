// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/scaffold_extension.dart';
import 'package:translator_app/routes.dart';
import 'package:translator_app/widgets/main.dart';
import 'package:uuid/uuid.dart';

class CreateProjectInstructions extends StatefulWidget {
  const CreateProjectInstructions({super.key});

  @override
  _CreateProjectInstructionsState createState() =>
      _CreateProjectInstructionsState();
}

class _CreateProjectInstructionsState extends State<CreateProjectInstructions> {
  final _formKey = GlobalKey<FormState>();
  String? _assignmentTopic;
  // String? _description;
  String? _sourceLanguage;
  String? _finalLanguage;
  int? _numberOfSources;
  DateTime? _date;
  TimeOfDay? _time;
  @override
  void initState() {
    // TODO: implement initState
    newProjectController.projectId.value = Uuid().v8();
    newContractController.managerId.value = firebaseAuth.currentUser!.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: mySecondaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 12.0,
                  color: textColor,
                ),
                onChanged: (value) {
                  newProjectController.title.value = value;
                  newContractController.projectTitle.value = value;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(8),
                    hintText: ''' Topic or title *''',
                    hintStyle: TextStyle(color: textColor, fontSize: 12)),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                  color: mySecondaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 12.0,
                  color: textColor,
                ),
                onChanged: (value) {
                  newProjectController.subject.value = value;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    hintText: ' Area of expertise *',
                    hintStyle: TextStyle(
                      color: textColor,
                      fontSize: 12.0,
                    )),
              ),
            ),
            const SizedBox(height: 16.0),
            // Padding(
            //   padding: const EdgeInsets.all(6.0),
            //   child: Text(
            //     'Languages',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 12.0,
            //       color: textColor,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 6.0),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Source Language',
                      hintStyle: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: textColor,
                      ),
                    ),
                    dropdownColor: myThirdColor,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: textColor,
                    ),
                    value: _sourceLanguage,
                    onChanged: (value) {
                      setState(() {
                        _sourceLanguage = value;
                      });
                      newProjectController.currentLanguage.value = value!;
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'English(UK)',
                        child: Text('English(UK)'),
                      ),
                      DropdownMenuItem(
                        value: 'English(US)',
                        child: Text('English(US'),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    dropdownColor: myThirdColor,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: textColor,
                    ),
                    value: _finalLanguage,
                    onChanged: (value) {
                      newProjectController.finalLanguage.value = value!;
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Kiswahili(KE)/(TZ)',
                        child: Text('Kiswahili(KE)/(TZ)'),
                      ),
                      DropdownMenuItem(
                        value: 'Swahili Congo',
                        child: Text('Swahili Congo'),
                      ),
                      DropdownMenuItem(
                        value: 'Lingala',
                        child: Text('Lingala'),
                      ),
                      DropdownMenuItem(
                        value: 'Kinywarwanda',
                        child: Text('Kinyarwanda'),
                      ),
                      DropdownMenuItem(
                        value: 'Ahmaric  ',
                        child: Text('Ahmaric'),
                      ),
                      DropdownMenuItem(
                        value: 'Somali  ',
                        child: Text('Somali'),
                      ),
                      DropdownMenuItem(
                        value: 'Kamba ',
                        child: Text('Kamba'),
                      ),
                      DropdownMenuItem(
                        value: 'Kikuyu  ',
                        child: Text('Kikuyu'),
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Target Language',
                      hintStyle: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 12.0,
                      color: textColor,
                    ),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        setState(() {
                          _date = date;
                        });
                        newProjectController.date.value = date;
                        newContractController.updateDeadlineDate(date, _time);
                      }
                    },
                    decoration: InputDecoration(
                      hintText:
                          _date?.toString().split(' ')[0] ?? 'Deadline Date',
                      hintStyle: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: textColor,
                      ),
                      prefixIcon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 12.0,
                      color: textColor,
                    ),
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() {
                          _time = time;
                        });
                        newProjectController.time.value = time;
                        newContractController.updateDeadlineDate(_date, time);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: _time?.format(context) ?? 'Time',
                      prefixIcon: const Icon(Icons.access_time),
                      hintStyle: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'Instructions & files',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8.0),
            UploadFilesButton(),
            const SizedBox(height: 8.0),
            Obx(() {
              return Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: mySecondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Uploaded files ${newProjectController.fileUrls.length.toString()}',
                  style: TextStyle(color: textColor, fontSize: 12),
                ),
              );
            }),
            const SizedBox(height: 16.0),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: mySecondaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 12.0,
                  color: textColor,
                ),
                expands: true,
                minLines: null,
                maxLines: null,
                onChanged: (value) {
                  newProjectController.description.value = value;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    hintText:
                        'Describe your assignment. Share references, links to articles, and list any other instructions.',
                    hintStyle: TextStyle(color: textColor, fontSize: 12)),
              ),
            ),
            const SizedBox(height: 16.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // TextButton(
                //   onPressed: () {
                //     // Handle Back button press
                //   },
                //   child: const Text('Back'),
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      createNewProjectPageThree,
                    );
                  },
                  child: const Text('Next Step'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
