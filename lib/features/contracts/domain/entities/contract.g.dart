// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractDataEntityImpl _$$ContractDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ContractDataEntityImpl(
      id: json['id'] as String,
      projectTitle: json['projectTitle'] as String,
      writerId: json['writerId'] as String,
      projectId: json['projectId'] as String,
      managerId: json['managerId'] as String,
      amount: json['amount'] as String,
      isCompleted: json['isCompleted'] as bool,
      created: json['created'] as String,
      dateClosed: DateTime.parse(json['dateClosed'] as String),
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      deadlineDate: DateTime.parse(json['deadlineDate'] as String),
    );

Map<String, dynamic> _$$ContractDataEntityImplToJson(
        _$ContractDataEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectTitle': instance.projectTitle,
      'writerId': instance.writerId,
      'projectId': instance.projectId,
      'managerId': instance.managerId,
      'amount': instance.amount,
      'isCompleted': instance.isCompleted,
      'created': instance.created,
      'dateClosed': instance.dateClosed.toIso8601String(),
      'dateCreated': instance.dateCreated.toIso8601String(),
      'deadlineDate': instance.deadlineDate.toIso8601String(),
    };
