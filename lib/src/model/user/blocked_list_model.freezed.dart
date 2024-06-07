// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocked_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlockedListModel _$BlockedListModelFromJson(Map<String, dynamic> json) {
  return _BlockedListModel.fromJson(json);
}

/// @nodoc
mixin _$BlockedListModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get userProfileImage => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockedListModelCopyWith<BlockedListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockedListModelCopyWith<$Res> {
  factory $BlockedListModelCopyWith(
          BlockedListModel value, $Res Function(BlockedListModel) then) =
      _$BlockedListModelCopyWithImpl<$Res, BlockedListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String name,
      String? userProfileImage,
      bool isBlocked,
      String username});
}

/// @nodoc
class _$BlockedListModelCopyWithImpl<$Res, $Val extends BlockedListModel>
    implements $BlockedListModelCopyWith<$Res> {
  _$BlockedListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userProfileImage = freezed,
    Object? isBlocked = null,
    Object? username = null,
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
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockedListModelImplCopyWith<$Res>
    implements $BlockedListModelCopyWith<$Res> {
  factory _$$BlockedListModelImplCopyWith(_$BlockedListModelImpl value,
          $Res Function(_$BlockedListModelImpl) then) =
      __$$BlockedListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String name,
      String? userProfileImage,
      bool isBlocked,
      String username});
}

/// @nodoc
class __$$BlockedListModelImplCopyWithImpl<$Res>
    extends _$BlockedListModelCopyWithImpl<$Res, _$BlockedListModelImpl>
    implements _$$BlockedListModelImplCopyWith<$Res> {
  __$$BlockedListModelImplCopyWithImpl(_$BlockedListModelImpl _value,
      $Res Function(_$BlockedListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userProfileImage = freezed,
    Object? isBlocked = null,
    Object? username = null,
  }) {
    return _then(_$BlockedListModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockedListModelImpl implements _BlockedListModel {
  const _$BlockedListModelImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.name,
      this.userProfileImage,
      this.isBlocked = true,
      required this.username});

  factory _$BlockedListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockedListModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String name;
  @override
  final String? userProfileImage;
  @override
  @JsonKey()
  final bool isBlocked;
  @override
  final String username;

  @override
  String toString() {
    return 'BlockedListModel(id: $id, name: $name, userProfileImage: $userProfileImage, isBlocked: $isBlocked, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockedListModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userProfileImage, userProfileImage) ||
                other.userProfileImage == userProfileImage) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, userProfileImage, isBlocked, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockedListModelImplCopyWith<_$BlockedListModelImpl> get copyWith =>
      __$$BlockedListModelImplCopyWithImpl<_$BlockedListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockedListModelImplToJson(
      this,
    );
  }
}

abstract class _BlockedListModel implements BlockedListModel {
  const factory _BlockedListModel(
      {@JsonKey(name: "_id") required final String id,
      required final String name,
      final String? userProfileImage,
      final bool isBlocked,
      required final String username}) = _$BlockedListModelImpl;

  factory _BlockedListModel.fromJson(Map<String, dynamic> json) =
      _$BlockedListModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get name;
  @override
  String? get userProfileImage;
  @override
  bool get isBlocked;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$BlockedListModelImplCopyWith<_$BlockedListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
