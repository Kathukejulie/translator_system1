import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class TranslationProjectDataEntity with _$TranslationProjectDataEntity {
  factory TranslationProjectDataEntity({
    required String id,
    required String postedBy,
    required String doneBy,
    required double price,
    required String title,
    required DateTime deadline,
    required DateTime dateCreated,
    required String task,
    required String subject,
    required String words,
    required String currentLanguage,
    required String finalLanguage,
    required String description,
    required String service,
    required bool isComplete,
    required String writerName,
    required String projectManagerName,
    required List<String> fileUrls,
    required List<String> finalFileUrls,
  }) = _TranslationProjectDataEntity;

  factory TranslationProjectDataEntity.fromJson(Map<String, dynamic> json) => _$TranslationProjectDataEntityFromJson(json);
}

