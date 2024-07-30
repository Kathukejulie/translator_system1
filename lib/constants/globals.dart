import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:translator_app/features/contracts/controllers/contracts_controller.dart';
import 'package:translator_app/features/contracts/di/contracts_system_injector.dart';
import 'package:translator_app/features/translation_project/controllers/projects_controller.dart';
import 'package:translator_app/features/translation_project/di/project_injector.dart';
import 'package:translator_app/features/users_system/controllers/users_controller.dart';
import 'package:translator_app/features/users_system/di/users_system_injector.dart';
import 'package:translator_app/features/contracts/controllers/new_contract_controller.dart';
import 'package:translator_app/features/translation_project/controllers/new_project_controller.dart';
import 'package:translator_app/features/users_system/controllers/new_user_controller.dart';
import 'package:translator_app/features/users_system/controllers/selected_user_controller.dart';
import 'package:get_it/get_it.dart';

var firestore = FirebaseFirestore.instance;

// final ordersCollection = firestore.collection("orders");
final newProjectController = NewProjectController();
final newContractController = NewContractController();
final authenticationController = AuthenticationController();
final projectsController = getit<TranslationProjectsController>();
final usersController = getit<UsersController>();
final selectedUserController = SelectedUserController();
final contractsController = getit<ContractsController>();
final projectsInjector = ProjectControllerInjector();
final usersInjector = UsersControllerInjector();
final contractsInjector = ContractsControllerInjector();
GetIt getit = GetIt.instance;
final firebaseAuth = FirebaseAuth.instance;
