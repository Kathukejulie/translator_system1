import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/contracts/domain/entities/contract.dart';
import 'package:uuid/uuid.dart';

class NewContractController extends GetxController {
  Rx<String> projectTitle = Rx<String>("");
  Rx<String> writerId = Rx<String>("");
  // Rx<String> projectId = Rx<String>("");
  Rx<String> managerId = Rx<String>("");
  Rx<String> amount = Rx<String>("");
  Rx<String> created = Rx<String>("");
  Rx<DateTime> dateClosed = Rx<DateTime>(DateTime.now());
  Rx<DateTime> deadlineDate = Rx<DateTime>(DateTime.now());

  ContractDataEntity order() => ContractDataEntity(
        id: const Uuid().v4(),
        projectTitle: projectTitle.value,
        writerId: writerId.value,
        projectId: newProjectController.projectId.value,
        managerId: managerId.value,
        amount: amount.value,
        isCompleted: false,
        created: created.value,
        dateClosed: dateClosed.value,
        dateCreated: DateTime.now(),
        deadlineDate: deadlineDate.value,
      );

  void updateDeadlineDate(DateTime? date, TimeOfDay? time) {
    if (date != null && time != null) {
      final DateTime combinedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      deadlineDate.value = combinedDateTime;
    }
  }
}
