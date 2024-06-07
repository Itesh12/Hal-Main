// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;
  String get mobileNo => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "followers_count")
  int get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: "following_count")
  int get followingCount => throw _privateConstructorUsedError;
  @JsonKey(name: "following_status")
  bool get followingStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String name,
      String username,
      String referralCode,
      String mobileNo,
      String? profilePic,
      Address address,
      String? description,
      @JsonKey(name: "followers_count") int followersCount,
      @JsonKey(name: "following_count") int followingCount,
      @JsonKey(name: "following_status") bool followingStatus});

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? referralCode = null,
    Object? mobileNo = null,
    Object? profilePic = freezed,
    Object? address = null,
    Object? description = freezed,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? followingStatus = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingStatus: null == followingStatus
          ? _value.followingStatus
          : followingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String username,
      String referralCode,
      String mobileNo,
      String? profilePic,
      Address address,
      String? description,
      @JsonKey(name: "followers_count") int followersCount,
      @JsonKey(name: "following_count") int followingCount,
      @JsonKey(name: "following_status") bool followingStatus});

  @override
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? referralCode = null,
    Object? mobileNo = null,
    Object? profilePic = freezed,
    Object? address = null,
    Object? description = freezed,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? followingStatus = null,
  }) {
    return _then(_$UserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingStatus: null == followingStatus
          ? _value.followingStatus
          : followingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.name,
      required this.username,
      required this.referralCode,
      required this.mobileNo,
      this.profilePic,
      required this.address,
      this.description,
      @JsonKey(name: "followers_count") required this.followersCount,
      @JsonKey(name: "following_count") required this.followingCount,
      @JsonKey(name: "following_status") required this.followingStatus});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String name;
  @override
  final String username;
  @override
  final String referralCode;
  @override
  final String mobileNo;
  @override
  final String? profilePic;
  @override
  final Address address;
  @override
  final String? description;
  @override
  @JsonKey(name: "followers_count")
  final int followersCount;
  @override
  @JsonKey(name: "following_count")
  final int followingCount;
  @override
  @JsonKey(name: "following_status")
  final bool followingStatus;

  @override
  String toString() {
    return 'User(name: $name, username: $username, referralCode: $referralCode, mobileNo: $mobileNo, profilePic: $profilePic, address: $address, description: $description, followersCount: $followersCount, followingCount: $followingCount, followingStatus: $followingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.followingStatus, followingStatus) ||
                other.followingStatus == followingStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      username,
      referralCode,
      mobileNo,
      profilePic,
      address,
      description,
      followersCount,
      followingCount,
      followingStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String name,
      required final String username,
      required final String referralCode,
      required final String mobileNo,
      final String? profilePic,
      required final Address address,
      final String? description,
      @JsonKey(name: "followers_count") required final int followersCount,
      @JsonKey(name: "following_count") required final int followingCount,
      @JsonKey(name: "following_status")
      required final bool followingStatus}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get name;
  @override
  String get username;
  @override
  String get referralCode;
  @override
  String get mobileNo;
  @override
  String? get profilePic;
  @override
  Address get address;
  @override
  String? get description;
  @override
  @JsonKey(name: "followers_count")
  int get followersCount;
  @override
  @JsonKey(name: "following_count")
  int get followingCount;
  @override
  @JsonKey(name: "following_status")
  bool get followingStatus;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
