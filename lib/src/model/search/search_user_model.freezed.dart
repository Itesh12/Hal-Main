// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchUserModel _$SearchUserModelFromJson(Map<String, dynamic> json) {
  return _SearchUserModel.fromJson(json);
}

/// @nodoc
mixin _$SearchUserModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get userProfileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUserModelCopyWith<SearchUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserModelCopyWith<$Res> {
  factory $SearchUserModelCopyWith(
          SearchUserModel value, $Res Function(SearchUserModel) then) =
      _$SearchUserModelCopyWithImpl<$Res, SearchUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String name,
      String username,
      String? userProfileImage});
}

/// @nodoc
class _$SearchUserModelCopyWithImpl<$Res, $Val extends SearchUserModel>
    implements $SearchUserModelCopyWith<$Res> {
  _$SearchUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? userProfileImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUserModelImplCopyWith<$Res>
    implements $SearchUserModelCopyWith<$Res> {
  factory _$$SearchUserModelImplCopyWith(_$SearchUserModelImpl value,
          $Res Function(_$SearchUserModelImpl) then) =
      __$$SearchUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String name,
      String username,
      String? userProfileImage});
}

/// @nodoc
class __$$SearchUserModelImplCopyWithImpl<$Res>
    extends _$SearchUserModelCopyWithImpl<$Res, _$SearchUserModelImpl>
    implements _$$SearchUserModelImplCopyWith<$Res> {
  __$$SearchUserModelImplCopyWithImpl(
      _$SearchUserModelImpl _value, $Res Function(_$SearchUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? userProfileImage = freezed,
  }) {
    return _then(_$SearchUserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchUserModelImpl implements _SearchUserModel {
  const _$SearchUserModelImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.name,
      required this.username,
      this.userProfileImage});

  factory _$SearchUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchUserModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String? userProfileImage;

  @override
  String toString() {
    return 'SearchUserModel(id: $id, name: $name, username: $username, userProfileImage: $userProfileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userProfileImage, userProfileImage) ||
                other.userProfileImage == userProfileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, username, userProfileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserModelImplCopyWith<_$SearchUserModelImpl> get copyWith =>
      __$$SearchUserModelImplCopyWithImpl<_$SearchUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchUserModelImplToJson(
      this,
    );
  }
}

abstract class _SearchUserModel implements SearchUserModel {
  const factory _SearchUserModel(
      {@JsonKey(name: "_id") required final String id,
      required final String name,
      required final String username,
      final String? userProfileImage}) = _$SearchUserModelImpl;

  factory _SearchUserModel.fromJson(Map<String, dynamic> json) =
      _$SearchUserModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String? get userProfileImage;
  @override
  @JsonKey(ignore: true)
  _$$SearchUserModelImplCopyWith<_$SearchUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
