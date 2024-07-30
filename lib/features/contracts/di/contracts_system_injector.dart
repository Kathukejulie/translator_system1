import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/contracts/controllers/contracts_controller.dart';
import 'package:translator_app/features/contracts/data/datasources/contracts_database_service.dart';
import 'package:translator_app/features/contracts/data/repositories/contracts_repository.dart';
import 'package:translator_app/features/contracts/domain/usecases/use_cases.dart';

class ContractsControllerInjector {
  init() async {
    getit
      ..registerFactory<ContractsController>(() => ContractsController(
            createUseCase: getit(),
            getAllUseCase: getit(),
            getByIdUseCase: getit(),
            updateUseCase: getit(),
            deleteUseCase: getit(),
            getByProjectIdUseCase: getit(),
          ))
      ..registerLazySingleton<UpdateContractUseCase>(
          () => UpdateContractUseCase(getit()))
      ..registerLazySingleton<CreateContractUseCase>(
          () => CreateContractUseCase(getit()))
      ..registerLazySingleton<GetAllContractsUseCase>(
          () => GetAllContractsUseCase(getit()))
      ..registerLazySingleton<GetContractByIdUseCase>(
          () => GetContractByIdUseCase(getit()))
      ..registerLazySingleton<DeleteContractUseCase>(
          () => DeleteContractUseCase(getit()))
      ..registerLazySingleton<GetContractByProjectIdUseCase>(
          () => GetContractByProjectIdUseCase(getit()))
      ..registerLazySingleton<ContractsRepository>(
          () => ContractsRepository(database: getit()))
      ..registerLazySingleton<ContractsDatabaseService>(
          () => ContractsDatabaseService());
  }
}
