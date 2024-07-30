
import 'package:translator_app/features/users_system/data/repositories/users_repository.dart';
import 'package:translator_app/features/users_system/domain/entities/user.dart';

class CreateUserUseCase {
  final UsersRepository _repository;

  CreateUserUseCase(this._repository);

  Future<void> call(UserDataEntity user) async {
    return await _repository.create(data: user);
  }
}

class GetAllUsersUseCase {
  final UsersRepository _repository;

  GetAllUsersUseCase(this._repository);

  Stream<List<Map<String, dynamic>>> call() {
    return _repository.getAll();
  }
}

class GetUserByIdUseCase {
  final UsersRepository _repository;

  GetUserByIdUseCase(this._repository);

  Future<UserDataEntity?> call(String id) async {
    return await _repository.getById(id: id);
  }
}

class UpdateUserUseCase {
  final UsersRepository _repository;

  UpdateUserUseCase(this._repository);

  Future<void> call(UserDataEntity user) async {
    return await _repository.update(newData: user);
  }
}

class DeleteUserUseCase {
  final UsersRepository _repository;

  DeleteUserUseCase(this._repository);

  Future<void> call(String id) async {
    return await _repository.delete(id: id);
  }
}
