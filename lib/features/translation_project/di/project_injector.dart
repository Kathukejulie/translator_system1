import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/translation_project/controllers/projects_controller.dart';
import 'package:translator_app/features/translation_project/data/datasources/projects_database_service.dart';
import 'package:translator_app/features/translation_project/data/repositories/projects_repository_impl.dart';
import 'package:translator_app/features/translation_project/domain/usecases/use_cases.dart';
import 'package:get/get.dart';

class ProjectControllerInjector {
  static void init() {
    //   getit
    //     ..registerFactoryAsync<TranslationProjectsController>(
    //         () async => TranslationProjectsController(
    //               createTranslationProjectUseCase: getit(),
    //               getAllTranslationProjectUseCase: getit(),
    //               getByIdTranslationProjectUseCase: getit(),
    //               updateTranslationProjectUseCase: getit(),
    //               deleteTranslationProjectUseCase: getit(),
    //             ))
    //     ..registerLazySingleton<CreateTranslationProjectUseCase>(
    //         () => CreateTranslationProjectUseCase(getit()))
    //     ..registerLazySingleton<GetAllTranslationProjectsUseCase>(
    //         () => GetAllTranslationProjectsUseCase(getit()))
    //     ..registerLazySingleton<GetProjectByIdUseCase>(
    //         () => GetProjectByIdUseCase(getit()))
    //     ..registerLazySingleton<UpdateTranslationProjectUseCase>(
    //         () => UpdateTranslationProjectUseCase(getit()))
    //     ..registerLazySingleton<DeleteTranslationProjectUseCase>(
    //         () => DeleteTranslationProjectUseCase(getit()))
    //     ..registerLazySingleton<TranslationProjectsRepository>(
    //         () => TranslationProjectsRepository(database: getit()))
    //     ..registerLazySingleton<ProjectsDatabaseService>(
    //         () => ProjectsDatabaseService());

    // Register use cases
    Get.put<TranslationProjectsDatabaseService>(
      TranslationProjectsDatabaseService(),
    );
    getit.registerLazySingleton<TranslationProjectsRepository>(
      () => TranslationProjectsRepository(
          database: Get.find<TranslationProjectsDatabaseService>()),
    );
    getit.registerLazySingleton<CreateTranslationProjectUseCase>(
      () => CreateTranslationProjectUseCase(getit()),
    );
    getit.registerLazySingleton<ChangeTranslationProjectStatusUseCase>(
      () => ChangeTranslationProjectStatusUseCase(getit()),
    );
    getit.registerLazySingleton<GetAllTranslationProjectsUseCase>(
      () => GetAllTranslationProjectsUseCase(getit()),
    );
    getit.registerLazySingleton<GetProjectByIdUseCase>(
      () => GetProjectByIdUseCase(getit()),
    );
    getit.registerLazySingleton<UpdateTranslationProjectUseCase>(
      () => UpdateTranslationProjectUseCase(getit()),
    );
    getit.registerLazySingleton<DeleteTranslationProjectUseCase>(
      () => DeleteTranslationProjectUseCase(getit()),
    );

    // Register controller
    getit.registerLazySingleton<TranslationProjectsController>(
      () => TranslationProjectsController(
        createTranslationProjectUseCase:
            getit<CreateTranslationProjectUseCase>(),
        getAllTranslationProjectUseCase:
            getit<GetAllTranslationProjectsUseCase>(),
        getByIdTranslationProjectUseCase: getit<GetProjectByIdUseCase>(),
        updateTranslationProjectUseCase:
            getit<UpdateTranslationProjectUseCase>(),
        deleteTranslationProjectUseCase:
            getit<DeleteTranslationProjectUseCase>(),
        changeTranslationProjectStatusUseCase:
            getit<ChangeTranslationProjectStatusUseCase>(),
      ),
    );
  }
}
