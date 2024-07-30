// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranslationProjectDataEntityImpl _$$TranslationProjectDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$TranslationProjectDataEntityImpl(
      id: json['id'] as String,
      postedBy: json['postedBy'] as String,
      doneBy: json['doneBy'] as String,
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      task: json['task'] as String,
      subject: json['subject'] as String,
      words: json['words'] as String,
      currentLanguage: json['currentLanguage'] as String,
      finalLanguage: json['finalLanguage'] as String,
      description: json['description'] as String,
      service: json['service'] as String,
      isComplete: json['isComplete'] as bool,
      writerName: json['writerName'] as String,
      projectManagerName: json['projectManagerName'] as String,
      fileUrls:
          (json['fileUrls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$TranslationProjectDataEntityImplToJson(
        _$TranslationProjectDataEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postedBy': instance.postedBy,
      'doneBy': instance.doneBy,
      'price': instance.price,
      'title': instance.title,
      'deadline': instance.deadline.toIso8601String(),
      'dateCreated': instance.dateCreated.toIso8601String(),
      'task': instance.task,
      'subject': instance.subject,
      'words': instance.words,
      'currentLanguage': instance.currentLanguage,
      'finalLanguage': instance.finalLanguage,
      'description': instance.description,
      'service': instance.service,
      'isComplete': instance.isComplete,
      'writerName': instance.writerName,
      'projectManagerName': instance.projectManagerName,
      'fileUrls': instance.fileUrls,
    };
