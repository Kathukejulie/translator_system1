import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/users_system/controllers/users_controller.dart';
import 'package:translator_app/features/users_system/data/datasources/users_database_service.dart';
import 'package:translator_app/features/users_system/data/repositories/users_repository.dart';
import 'package:translator_app/features/users_system/domain/usecases/use_cases.dart';

class UsersControllerInjector {
  init() async {
    getit
      ..registerFactory<UsersController>(() => UsersController(
          createUseCase: getit(),
          getAllUseCase: getit(),
          getByIdUseCase: getit(),
          updateUseCase: getit(),
          deleteUseCase: getit()))
      ..registerLazySingleton<UpdateUserUseCase>(
          () => UpdateUserUseCase(getit()))
      ..registerLazySingleton<CreateUserUseCase>(
          () => CreateUserUseCase(getit()))
      ..registerLazySingleton<GetAllUsersUseCase>(
          () => GetAllUsersUseCase(getit()))
      ..registerLazySingleton<GetUserByIdUseCase>(
          () => GetUserByIdUseCase(getit()))
      ..registerLazySingleton<DeleteUserUseCase>(
          () => DeleteUserUseCase(getit()))
      ..registerLazySingleton<UsersRepository>(() => UsersRepository(database: getit()))
      ..registerLazySingleton<UsersDatabaseService>(() => UsersDatabaseService());
  }
}
