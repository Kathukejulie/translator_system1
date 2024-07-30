import 'package:translator_app/features/users_system/domain/entities/user.dart';
import 'package:translator_app/features/users_system/domain/usecases/use_cases.dart';


class UsersController{
  final CreateUserUseCase _createUseCase;
  final GetAllUsersUseCase _getAllUseCase;
  final GetUserByIdUseCase _getByIdUseCase;
  final UpdateUserUseCase _updateUseCase;
  final DeleteUserUseCase _deleteUseCase;

  UsersController({
    required CreateUserUseCase createUseCase,
    required GetAllUsersUseCase getAllUseCase,
    required GetUserByIdUseCase getByIdUseCase,
    required UpdateUserUseCase updateUseCase,
    required DeleteUserUseCase deleteUseCase,
  })  : _createUseCase = createUseCase,
        _getAllUseCase = getAllUseCase,
        _getByIdUseCase = getByIdUseCase,
        _updateUseCase = updateUseCase,
        _deleteUseCase = deleteUseCase;

  // @override
  Future<void> create(UserDataEntity data) async =>
      await _createUseCase.call(data);

  // @override
  Stream<List<Map<String, dynamic>>> getAll() => _getAllUseCase.call();

  // @override
  Future<UserDataEntity?> getById(String id) async =>
      await _getByIdUseCase.call(id);

  // @override
  Future<void> updatedata(UserDataEntity data) async =>
      await _updateUseCase.call(data);

  // @override
  Future<void> delete(String id) async => await _deleteUseCase.call(id);
}
