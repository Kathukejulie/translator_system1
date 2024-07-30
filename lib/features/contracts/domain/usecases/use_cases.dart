
import 'package:translator_app/features/contracts/data/repositories/contracts_repository.dart';
import 'package:translator_app/features/contracts/domain/entities/contract.dart';

class CreateContractUseCase {
  final ContractsRepository _repository;

  CreateContractUseCase(this._repository);

  Future<void> call(ContractDataEntity Contract) async {
    return await _repository.create(data: Contract);
  }
}

class GetAllContractsUseCase {
  final ContractsRepository _repository;

  GetAllContractsUseCase(this._repository);

  Stream<List<Map<String, dynamic>>> call() {
    return _repository.getAll();
  }
}

class GetContractByIdUseCase {
  final ContractsRepository _repository;

  GetContractByIdUseCase(this._repository);

  Future<ContractDataEntity?> call(String id) async {
    return await _repository.getById(id: id);
  }
}

class UpdateContractUseCase {
  final ContractsRepository _repository;

  UpdateContractUseCase(this._repository);

  Future<void> call(Map<String, dynamic> data, String contractId) async {
    return await _repository.update(newData: data, contractId: contractId);
  }
}

class DeleteContractUseCase {
  final ContractsRepository _repository;

  DeleteContractUseCase(this._repository);

  Future<void> call(String id) async {
    return await _repository.delete(id: id);
  }
}

class GetContractByProjectIdUseCase {
  final ContractsRepository _repository;

  GetContractByProjectIdUseCase(this._repository);

  Future<ContractDataEntity?> call(String projectId) async {
    return await _repository.getByProjectId(projectId: projectId);
  }
}
