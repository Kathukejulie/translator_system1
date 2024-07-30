import 'package:intl/intl.dart';
import 'package:translator_app/features/contracts/domain/entities/contract.dart';
import 'package:translator_app/features/contracts/ui/contract_details/main.dart';
import 'package:translator_app/features/contracts/ui/main.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/create_new_project_page.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/create_new_project_page_three.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/create_new_project_page_two.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/create_project_form.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/create_project_instructions.dart';
import 'package:translator_app/features/translation_project/ui/my_projects/main.dart';
import 'package:translator_app/features/translation_project/ui/project_details/main.dart';
import 'package:translator_app/features/users_system/ui/authentication/signin.dart';
import 'package:translator_app/features/users_system/ui/authentication/signup.dart';
import 'package:translator_app/homepage/homepage.dart';
import 'package:translator_app/features/users_system/ui/my_writers/main_writers_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route generatedPageRoutes(RouteSettings settings) {
    final args = settings.arguments;
    // implement business logic here
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case myProjects:
        if (args is bool) {
          return MaterialPageRoute(
              builder: (_) => MainOrdersPage(
                    status: args,
                  ));
        }
        return _errorRoute();
      case myContracts:
        return MaterialPageRoute(builder: (_) => MainContractsPage());
      // case myBids:
      //   return MaterialPageRoute(builder: (_) => const MainBidsPage());
      case mainprojectDetails:
        if (args is TranslationProjectDataEntity) {
          return MaterialPageRoute(
            builder: (_) => MainProjectDetailsPage(project: args),
          );
        }
        return _errorRoute();
      case mainContractsPage:
        if (args is ContractDataEntity) {
          return MaterialPageRoute(
            builder: (_) => MainContractDetailsPage(contract: args),
          );
        }
        return _errorRoute();
      case myWriters:
        return MaterialPageRoute(builder: (_) => const MainWritersPage());
      // case accountPaymentAndTransactionsPage:
      //   return MaterialPageRoute(builder: (_) => const MainPaymentsPage());
      case createNewProject:
        return MaterialPageRoute(builder: (_) => CreateNewProjectPage());
      case createNewProjectPageTwo:
        return MaterialPageRoute(
            builder: (_) => const CreateNewProjectPageTwo());
      case signin:
        return MaterialPageRoute(builder: (_) => const SignInSection());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUpSection());
      case createNewProjectPageThree:
        return MaterialPageRoute(
            builder: (_) => const CreateNewProjectPageThree());
      // case myContracts:
      //   return MaterialPageRoute(builder: (_) => const MainContractsPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('An error occurred'),
        ),
      ),
    );
  }
}

//Routes
const String home = '/home';
const String signup = '/signup';
const String signin = '/signin';
const String mainprojectDetails = '/mainprojectDetails';
const String mainContractsPage = '/contractsDetails';
const String myProjects = '/myProjects';
const String myBids = '/myBids';
const String createNewProject = '/createNewProject';
const String createNewProjectPageTwo = '/createNewProjectPageTwo';
const String createNewProjectPageThree = '/createNewProjectPageThree';
const String myWriters = '/writers';
const String myContracts = '/myContracts';
const String notificationsPage = '/notificationsPage';
const String rulesAndTipsPage = '/rulesAndTips';
const String accountPaymentAndTransactionsPage =
    '/accountPaymentAndTransactions';

final formatter = DateFormat('MMM d, h:mm a');
