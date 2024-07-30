import 'package:translator_app/features/contracts/data/datasources/contracts_database_service.dart';
import 'package:translator_app/features/contracts/domain/entities/contract.dart';

class ContractsRepository {
  final ContractsDatabaseService _database;

  const ContractsRepository({
    required ContractsDatabaseService database,
  }) : _database = database;

  // Create operation

  Future<void> create({required ContractDataEntity data}) async {
    await _database.createData(data.toJson());
  }

  // Read operation - Get all orders

  Stream<List<Map<String, dynamic>>> getAll() => _database.readAllData();

  // Read operation - Get order by ID

  Future<ContractDataEntity> getById({required String id}) async {
    final data = await _database.readData(id);

    return ContractDataEntity.fromJson(data.data()!);
  }

  // Update operation

  Future<void> update({required Map<String, dynamic> newData, required String contractId}) async =>
      await _database.updateData(newData, contractId);

  // Delete operation

  Future<void> delete({required String id}) async =>
      await _database.deleteData(id);

  Future<ContractDataEntity?> getByProjectId(
      {required String projectId}) async {
    final data = await _database.readDataByProjectId(projectId);
    if (data.docs.isNotEmpty) {
      return ContractDataEntity.fromJson(data.docs.first.data()!);
    }
    return null;
  }
}
