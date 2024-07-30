import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/translation_project/di/project_injector.dart';
import 'package:translator_app/features/users_system/ui/authentication/signin.dart';
import 'package:translator_app/firebase_options.dart';
import 'package:translator_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await usersInjector.init();
  ProjectControllerInjector.init();
  await contractsInjector.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        const GetMaterialApp(
          onGenerateRoute: Routes.generatedPageRoutes,
          debugShowCheckedModeBanner: false,
          initialRoute: signin,
          home: SignInSection(),
        ),
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(730, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
