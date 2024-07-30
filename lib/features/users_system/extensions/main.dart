import 'package:translator_app/constants/globals.dart';

extension DataMapExtension on List<Map<String, dynamic>> {
  Iterable<Map<String, dynamic>> whereBelongsToUser() => where((element) =>
      element["postedBy"] == authenticationController.loggedInUser.value!.id);
  Iterable<Map<String, dynamic>> whereAssignedToUser() => where((element) =>
      element["doneBy"] == authenticationController.loggedInUser.value!.id);
}
