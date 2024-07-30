import 'package:translator_app/features/translation_project/data/repositories/projects_repository_impl.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';

class CreateTranslationProjectUseCase {
  final TranslationProjectsRepository _repository;

  CreateTranslationProjectUseCase(this._repository);

  Future<void> call(TranslationProjectDataEntity project) async {
    return await _repository.create(data: project);
  }
}

class StreamAllTranslationProjectsUseCase {
  final TranslationProjectsRepository _repository;

  StreamAllTranslationProjectsUseCase(this._repository);

  Stream<List<Map<String, dynamic>>> call() {
    return _repository.streamAll();
  }
}

class GetAllTranslationProjectsUseCase {
  final TranslationProjectsRepository _repository;

  GetAllTranslationProjectsUseCase(this._repository);

  Future<List<Map<String, dynamic>>> call() {
    return _repository.getAll();
  }
}

class GetProjectByIdUseCase {
  final TranslationProjectsRepository _repository;

  GetProjectByIdUseCase(this._repository);

  Future<TranslationProjectDataEntity?> call(String id) async {
    return await _repository.getById(id: id);
  }
}

class UpdateTranslationProjectUseCase {
  final TranslationProjectsRepository _repository;

  UpdateTranslationProjectUseCase(this._repository);

  Future<void> call(TranslationProjectDataEntity project) async {
    return await _repository.update(newData: project);
  }
}

class DeleteTranslationProjectUseCase {
  final TranslationProjectsRepository _repository;

  DeleteTranslationProjectUseCase(this._repository);

  Future<void> call(String id) async {
    return await _repository.delete(id: id);
  }
}

class ChangeTranslationProjectStatusUseCase {
  final TranslationProjectsRepository _repository;

  ChangeTranslationProjectStatusUseCase(this._repository);

  Future<void> call({required bool status, required String documentId}) async {
    return await _repository.changeStatus(
        status: status, documentId: documentId);
  }
}
