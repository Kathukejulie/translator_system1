import 'package:translator_app/features/contracts/domain/entities/contract.dart';
import 'package:translator_app/features/contracts/domain/usecases/use_cases.dart';

class ContractsController {
  final CreateContractUseCase _createUseCase;
  final GetAllContractsUseCase _getAllUseCase;
  final GetContractByIdUseCase _getByIdUseCase;
  final GetContractByProjectIdUseCase _getByProjectIdUseCase;
  final UpdateContractUseCase _updateUseCase;
  final DeleteContractUseCase _deleteUseCase;

  ContractsController({
    required CreateContractUseCase createUseCase,
    required GetAllContractsUseCase getAllUseCase,
    required GetContractByIdUseCase getByIdUseCase,
    required GetContractByProjectIdUseCase getByProjectIdUseCase,
    required UpdateContractUseCase updateUseCase,
    required DeleteContractUseCase deleteUseCase,
  })  : _createUseCase = createUseCase,
        _getAllUseCase = getAllUseCase,
        _getByIdUseCase = getByIdUseCase,
        _getByProjectIdUseCase = getByProjectIdUseCase,
        _updateUseCase = updateUseCase,
        _deleteUseCase = deleteUseCase;

  Future<void> create(ContractDataEntity data) async =>
      await _createUseCase.call(data);

  Stream<List<Map<String, dynamic>>> getAll() => _getAllUseCase.call();

  Future<ContractDataEntity?> getById(String id) async =>
      await _getByIdUseCase.call(id);

  Future<void> updatedata(Map<String, dynamic> data, String contractId) async =>
      await _updateUseCase.call(data, contractId);

  Future<void> delete(String id) async => await _deleteUseCase.call(id);

  Future<ContractDataEntity?> getByProjectId(String projectId) async =>
      await _getByProjectIdUseCase.call(projectId);

  Future<void> closeContract(String projectId) async {
    final contract = await getByProjectId(projectId);
    await updatedata(
        contract!
            .copyWith(
              isCompleted: true,
              dateClosed: DateTime.now(),
            )
            .toJson(),
        contract!.id);
  }
}
