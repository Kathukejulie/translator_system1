import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/users_system/domain/entities/user.dart';
import 'package:translator_app/homepage/homepage.dart';
import 'package:translator_app/routes.dart';

class AuthenticationController extends GetxController {
  Rx<String> userId = Rx<String>("");
  Rx<String> password = Rx<String>("");
  Rx<String> passwordTwo = Rx<String>("");
  Rx<String> phoneNumber = Rx<String>("");
  Rx<String> email = Rx<String>("");
  Rx<String> about = Rx<String>("");
  Rx<String> fullName = Rx<String>("");
  Rx<bool> isWriter = Rx<bool>(false);
  final Rx<bool> _userIsNull = Rx<bool>(false);
  final Rx<String> _message = Rx<String>("");
  final Rx<String> invoiceNumber = Rx<String>("");
  final Rx<String> expertiseLanguage = Rx<String>("");
  final loggedInUser = Rx<UserDataEntity?>(null);
  Rx<bool> isLoggedIn = Rx<bool>(false);

// invalid-email:
// Thrown if the email address is not valid.
// user-disabled:
// Thrown if the user corresponding to the given email has been disabled.
// user-not-found:
// Thrown if there is no user corresponding to the given email.
// wrong-password:
  Future<UserCredential> _createAuthUser() async =>
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email.value, password: password.value);

  Future<UserCredential> _signInUser() async => await firebaseAuth
      .signInWithEmailAndPassword(email: email.value, password: password.value);

  Future<UserCredential> _checkIfCreateUserAuthSuccess() async {
    final result = await _createAuthUser().then((value) {
      _userIsNull.value = value.user == null;
      return value;
    });
    return result;
  }

  Future<UserCredential> _checkIfSignInAuthSuccess() async {
    final result = await _signInUser().then((value) {
      _userIsNull.value = value.user == null;
      return value;
    });
    return result;
  }

  String _checkIfAllUserDataIsSaved() {
    if (password.value != passwordTwo.value) {
      _message.value = "Passwords must match";
    } else if (password.value.length < 6) {
      _message.value = "Password too short!";
    } else if (password.value != passwordTwo.value) {
      _message.value = "Password should be similar!";
    }
    // check fullnames
    else if (!fullName.value.contains(" ")) {
      _message.value = "Enter both names";
    } else if (fullName.value.length < 4) {
      _message.value = "Name invalid";
    }
    // check email
    else if (!email.value.contains("@")) {
      _message.value = "Invalid email";
    } else if (!email.value.contains(".")) {
      _message.value = "Invalid email";
    } else if (email.value.length < 7) {
      _message.value = "Invalid email";
    }
    // check phone number
    else if (phoneNumber.value.length < 10) {
      _message.value = "Invalid phone number";
    } else {
      _message.value = "Success";
    }
    // check about
    return _message.value;
  }

  String _checkSignInUserInfor() {
    if (password.value.length < 6) {
      _message.value = "Password too short!";
    }

    // check email
    else if (!email.value.contains("@")) {
      _message.value = "Invalid email";
    } else if (!email.value.contains(".")) {
      _message.value = "Invalid email";
    } else if (email.value.length < 7) {
      _message.value = "Invalid email";
    } else {
      _message.value = "Success";
    }
    // check about
    return _message.value;
  }

  Future<void> registerUser() async => _checkIfAllUserDataIsSaved() == "Success"
      ? await _checkIfCreateUserAuthSuccess().then((value) {
          if (_userIsNull.isFalse) {
            UserDataEntity user = UserDataEntity(
              id: value.user!.uid,
              phoneNumber: userId.value,
              email: email.value,
              about: about.value,
              fullName: fullName.value,
              isWriter: isWriter.value, invoiceNumber: invoiceNumber.value, expertiseLanguage: '',
              
            );
            usersController
                .create(user)
                .whenComplete(() => Get.showSnackbar(const GetSnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                      messageText: Text("Registration succesful"),
                    )));
          } else {
            Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              messageText: Text(_message.value),
            ));
          }
        })
      : Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          messageText: Text(_message.value),
        ));

  Future<void> signinUser(BuildContext context) async =>
      _checkSignInUserInfor() == "Success"
          ? await _checkIfSignInAuthSuccess().then((value) {
              if (_userIsNull.isFalse) {
                usersController.getById(value.user!.uid).then((value) {
                  if (value != null) {
                    loggedInUser.value = value;
                    isLoggedIn.value = true;
                    Get.showSnackbar(const GetSnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                      messageText: Text("Welcome Back!"),
                    ));
                    Navigator.of(context).pushNamed(home);
                  } else {
                    Get.showSnackbar(const GetSnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red,
                      messageText: Text("Something went wrong!"),
                    ));
                  }
                });
              } else {
                Get.showSnackbar(GetSnackBar(
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.red,
                  messageText: Text(_message.value),
                ));
              }
            })
          : Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              messageText: Text(_message.value),
            ));
}
