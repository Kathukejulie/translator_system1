import 'package:translator_app/features/users_system/data/datasources/users_database_service.dart';
import 'package:translator_app/features/users_system/domain/entities/user.dart';

class UsersRepository {
  final UsersDatabaseService _database;

  const UsersRepository({
    required UsersDatabaseService database,
  }) : _database = database;

  // Create operation
  // @override
  Future<void> create({required UserDataEntity data}) async {
    await _database.createData(data.toJson());
  }

  // Read operation - Get all orders
  // @override
  Stream<List<Map<String, dynamic>>> getAll() => _database.readAllData();

  // Read operation - Get order by ID
  // @override
  Future<UserDataEntity?> getById({required String id}) async {
    final data = await _database.readData(id);
    if (data != null) return UserDataEntity.fromJson(data!.data()!);

    return null;
  }

  // Update operation
  // @override
  Future<void> update({required UserDataEntity newData}) async =>
      await _database.updateData(newData.toJson());

  // Delete operation
  // @override
  Future<void> delete({required String id}) async =>
      await _database.deleteData(id);
}
