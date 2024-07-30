// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataEntityImpl _$$UserDataEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserDataEntityImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      about: json['about'] as String,
      phoneNumber: json['phoneNumber'] as String,
      isWriter: json['isWriter'] as bool,
    );

Map<String, dynamic> _$$UserDataEntityImplToJson(
        _$UserDataEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'about': instance.about,
      'phoneNumber': instance.phoneNumber,
      'isWriter': instance.isWriter,
    };
