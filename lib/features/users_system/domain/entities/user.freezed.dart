// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDataEntity _$UserDataEntityFromJson(Map<String, dynamic> json) {
  return _UserDataEntity.fromJson(json);
}

/// @nodoc
mixin _$UserDataEntity {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  bool get isWriter => throw _privateConstructorUsedError;
  String get invoiceNumber => throw _privateConstructorUsedError;
  String get expertiseLanguage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataEntityCopyWith<UserDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataEntityCopyWith<$Res> {
  factory $UserDataEntityCopyWith(
          UserDataEntity value, $Res Function(UserDataEntity) then) =
      _$UserDataEntityCopyWithImpl<$Res, UserDataEntity>;
  @useResult
  $Res call(
      {String id,
      String email,
      String fullName,
      String about,
      String phoneNumber,
      bool isWriter,
      String invoiceNumber,
      String expertiseLanguage});
}

/// @nodoc
class _$UserDataEntityCopyWithImpl<$Res, $Val extends UserDataEntity>
    implements $UserDataEntityCopyWith<$Res> {
  _$UserDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? about = null,
    Object? phoneNumber = null,
    Object? isWriter = null,
    Object? invoiceNumber = null,
    Object? expertiseLanguage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isWriter: null == isWriter
          ? _value.isWriter
          : isWriter // ignore: cast_nullable_to_non_nullable
              as bool,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expertiseLanguage: null == expertiseLanguage
          ? _value.expertiseLanguage
          : expertiseLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataEntityImplCopyWith<$Res>
    implements $UserDataEntityCopyWith<$Res> {
  factory _$$UserDataEntityImplCopyWith(_$UserDataEntityImpl value,
          $Res Function(_$UserDataEntityImpl) then) =
      __$$UserDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String fullName,
      String about,
      String phoneNumber,
      bool isWriter,
      String invoiceNumber,
      String expertiseLanguage});
}

/// @nodoc
class __$$UserDataEntityImplCopyWithImpl<$Res>
    extends _$UserDataEntityCopyWithImpl<$Res, _$UserDataEntityImpl>
    implements _$$UserDataEntityImplCopyWith<$Res> {
  __$$UserDataEntityImplCopyWithImpl(
      _$UserDataEntityImpl _value, $Res Function(_$UserDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? about = null,
    Object? phoneNumber = null,
    Object? isWriter = null,
    Object? invoiceNumber = null,
    Object? expertiseLanguage = null,
  }) {
    return _then(_$UserDataEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isWriter: null == isWriter
          ? _value.isWriter
          : isWriter // ignore: cast_nullable_to_non_nullable
              as bool,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expertiseLanguage: null == expertiseLanguage
          ? _value.expertiseLanguage
          : expertiseLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataEntityImpl implements _UserDataEntity {
  _$UserDataEntityImpl(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.about,
      required this.phoneNumber,
      required this.isWriter,
      required this.invoiceNumber,
      required this.expertiseLanguage});

  factory _$UserDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final String about;
  @override
  final String phoneNumber;
  @override
  final bool isWriter;
  @override
  final String invoiceNumber;
  @override
  final String expertiseLanguage;

  @override
  String toString() {
    return 'UserDataEntity(id: $id, email: $email, fullName: $fullName, about: $about, phoneNumber: $phoneNumber, isWriter: $isWriter, invoiceNumber: $invoiceNumber, expertiseLanguage: $expertiseLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isWriter, isWriter) ||
                other.isWriter == isWriter) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.expertiseLanguage, expertiseLanguage) ||
                other.expertiseLanguage == expertiseLanguage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, fullName, about,
      phoneNumber, isWriter, invoiceNumber, expertiseLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataEntityImplCopyWith<_$UserDataEntityImpl> get copyWith =>
      __$$UserDataEntityImplCopyWithImpl<_$UserDataEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataEntityImplToJson(
      this,
    );
  }
}

abstract class _UserDataEntity implements UserDataEntity {
  factory _UserDataEntity(
      {required final String id,
      required final String email,
      required final String fullName,
      required final String about,
      required final String phoneNumber,
      required final bool isWriter,
      required final String invoiceNumber,
      required final String expertiseLanguage}) = _$UserDataEntityImpl;

  factory _UserDataEntity.fromJson(Map<String, dynamic> json) =
      _$UserDataEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  @override
  String get about;
  @override
  String get phoneNumber;
  @override
  bool get isWriter;
  @override
  String get invoiceNumber;
  @override
  String get expertiseLanguage;
  @override
  @JsonKey(ignore: true)
  _$$UserDataEntityImplCopyWith<_$UserDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
