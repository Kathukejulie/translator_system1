import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/features/translation_project/domain/usecases/use_cases.dart';

class TranslationProjectsController {
  final CreateTranslationProjectUseCase _createTranslationProjectUseCase;
  final GetAllTranslationProjectsUseCase _getAllTranslationProjectUseCase;
  final GetProjectByIdUseCase _getByIdTranslationProjectUseCase;
  final UpdateTranslationProjectUseCase _updateTranslationProjectUseCase;
  final DeleteTranslationProjectUseCase _deleteTranslationProjectUseCase;
  final ChangeTranslationProjectStatusUseCase
      _changeTranslationProjectStatusUseCase;

  TranslationProjectsController({
    required CreateTranslationProjectUseCase createTranslationProjectUseCase,
    required GetAllTranslationProjectsUseCase getAllTranslationProjectUseCase,
    required GetProjectByIdUseCase getByIdTranslationProjectUseCase,
    required UpdateTranslationProjectUseCase updateTranslationProjectUseCase,
    required DeleteTranslationProjectUseCase deleteTranslationProjectUseCase,
    required ChangeTranslationProjectStatusUseCase
        changeTranslationProjectStatusUseCase,
  })  : _createTranslationProjectUseCase = createTranslationProjectUseCase,
        _getAllTranslationProjectUseCase = getAllTranslationProjectUseCase,
        _getByIdTranslationProjectUseCase = getByIdTranslationProjectUseCase,
        _updateTranslationProjectUseCase = updateTranslationProjectUseCase,
        _deleteTranslationProjectUseCase = deleteTranslationProjectUseCase,
        _changeTranslationProjectStatusUseCase =
            changeTranslationProjectStatusUseCase;

  // @override
  Future<void> create(TranslationProjectDataEntity data) async =>
      await _createTranslationProjectUseCase.call(data);

  // @override
  Future<void> closeProject(String documentId) async =>
      await _changeTranslationProjectStatusUseCase.call(
          documentId: documentId, status: true);

  // @override
  Stream<List<Map<String, dynamic>>> streamAll() =>
      _getAllTranslationProjectUseCase.call();

  // @override
  Future<dynamic> getById(String id) async {
    await _getByIdTranslationProjectUseCase.call(id);
  }

  // @override
  Future<void> updatedata(TranslationProjectDataEntity data) async =>
      await _updateTranslationProjectUseCase.call(data);

  // @override
  Future<void> delete(String id) async =>
      await _deleteTranslationProjectUseCase.call(id);
}
