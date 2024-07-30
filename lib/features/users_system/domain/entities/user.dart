import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserDataEntity with _$UserDataEntity {
  factory UserDataEntity({
    required String id,
    required String email,
    required String fullName,
    required String about,
    required String phoneNumber,
    required bool isWriter,
  }) = _UserDataEntity;

  factory UserDataEntity.fromJson(Map<String, dynamic> json) => _$UserDataEntityFromJson(json);
}
