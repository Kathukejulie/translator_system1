import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract.freezed.dart';
part 'contract.g.dart';

@freezed
class ContractDataEntity with _$ContractDataEntity {
  factory ContractDataEntity({
    required String id,
    required String projectTitle,
    required String writerId,
    required String projectId,
    required String managerId,
    required String amount,
    required bool isCompleted,
    required String created,
    required DateTime dateClosed,
    required DateTime dateCreated,
    required DateTime deadlineDate,
  }) = _ContractDataEntity;

  factory ContractDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ContractDataEntityFromJson(json);
}
