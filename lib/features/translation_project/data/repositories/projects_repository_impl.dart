import 'package:translator_app/features/translation_project/data/datasources/projects_database_service.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';

class TranslationProjectsRepository {
  // T fromJson(Map<String, dynamic> json) {
  //   if (T == TranslationProjectDataEntity) {
  //     return TranslationProjectDataEntity.fromJson(json) as T;
  //   } else if (T == TranslationProjectDataEntity) {
  //     return TranslationProjectDataEntity.fromJson(json) as T;
  //   } else {
  //     throw Exception('Unsupported type');
  //   }
  // }

  final TranslationProjectsDatabaseService _database;

  const TranslationProjectsRepository({
    required TranslationProjectsDatabaseService database,
  }) : _database = database;

  // Create operation

  Future<void> create({required TranslationProjectDataEntity data}) async {
    await _database.createData(data.toJson());
  }

  // Read operation - Get all Projects

  Stream<List<Map<String, dynamic>>> streamAll() => _database.streamAllData();

  // Read operation - Get Project by ID

  Future<TranslationProjectDataEntity> getById({required String id}) async {
    final data = await _database.readData(id);

    return TranslationProjectDataEntity.fromJson(data.data()!);
  }

  // Update operation

  Future<void> update({required TranslationProjectDataEntity newData}) async =>
      await _database.updateData(newData.toJson());

  // Delete operation

  Future<void> delete({required String id}) async =>
      await _database.deleteData(id);

  changeStatus({required bool status, required String documentId}) async =>
      await _database.changeStatus(status: status, documentId: documentId);
}
