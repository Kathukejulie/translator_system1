import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:uuid/uuid.dart';

class NewProjectController extends GetxController {
  Rx<double> price = Rx<double>(0);
  Rx<String> title = Rx<String>("");
  Rx<DateTime?> date = Rx<DateTime?>(null);
  Rx<TimeOfDay?> time = Rx<TimeOfDay?>(null);
  Rx<String> task = Rx<String>("");
  Rx<String> userName = Rx<String>("");
  Rx<String> userId = Rx<String>("");
  Rx<String> projectId = Rx<String>("");
  Rx<String> subject = Rx<String>("");
  Rx<String> words = Rx<String>("");
  Rx<String> currentLanguage = Rx<String>("");
  Rx<String> finalLanguage = Rx<String>("");
  Rx<String> description = Rx<String>("");
  Rx<String> service = Rx<String>("");
  RxList<String> fileUrls = RxList<String>();

  TranslationProjectDataEntity order() => TranslationProjectDataEntity(
        id: projectId.value,
        postedBy: authenticationController.loggedInUser.value!.id,
        doneBy: userId.value,
        price: price.value,
        title: title.value,
        deadline: DateTime(
          date.value!.year,
          date.value!.month,
          date.value!.day,
          time.value!.hour,
          time.value!.minute,
        ),
        dateCreated: DateTime.now(),
        task: task.value,
        writerName: userName.value,
        subject: subject.value,
        words: words.value,
        currentLanguage: currentLanguage.value,
        finalLanguage: finalLanguage.value,
        description: description.value,
        service: service.value,
        isComplete: false,
        projectManagerName:
            authenticationController.loggedInUser.value!.fullName,
        fileUrls: fileUrls.value,
      );

  Future<void> uploadFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );

    if (result != null) {
      List<Future<String>> uploadTasks = result.files.map((file) async {
        String fileName = Uuid().v4() + '.' + file.extension!;
        UploadTask uploadTask = FirebaseStorage.instance
            .ref('uploads/$fileName')
            .putData(file.bytes!);

        TaskSnapshot snapshot = await uploadTask;
        return await snapshot.ref.getDownloadURL();
      }).toList();

      List<String> urls = await Future.wait(uploadTasks);
      fileUrls.addAll(urls);
    } else {
      // User canceled the picker
      print('No files selected');
    }
  }
}
