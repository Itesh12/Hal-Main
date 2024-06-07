// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SellerStatusModel _$SellerStatusModelFromJson(Map<String, dynamic> json) {
  return _SellerStatusModel.fromJson(json);
}

/// @nodoc
mixin _$SellerStatusModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get businessDetails => throw _privateConstructorUsedError;
  List<Document> get documents => throw _privateConstructorUsedError;
  bool get hasRegistered => throw _privateConstructorUsedError;
  @JsonKey(name: "SPID")
  String get spid => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get sellerStatus => throw _privateConstructorUsedError;
  String? get sellerType => throw _privateConstructorUsedError;
  String? get rejectReason => throw _privateConstructorUsedError;
  String? get inActiveReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerStatusModelCopyWith<SellerStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerStatusModelCopyWith<$Res> {
  factory $SellerStatusModelCopyWith(
          SellerStatusModel value, $Res Function(SellerStatusModel) then) =
      _$SellerStatusModelCopyWithImpl<$Res, SellerStatusModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String userId,
      String fullName,
      String email,
      String businessDetails,
      List<Document> documents,
      bool hasRegistered,
      @JsonKey(name: "SPID") String spid,
      String status,
      String sellerStatus,
      String? sellerType,
      String? rejectReason,
      String? inActiveReason});
}

/// @nodoc
class _$SellerStatusModelCopyWithImpl<$Res, $Val extends SellerStatusModel>
    implements $SellerStatusModelCopyWith<$Res> {
  _$SellerStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? fullName = null,
    Object? email = null,
    Object? businessDetails = null,
    Object? documents = null,
    Object? hasRegistered = null,
    Object? spid = null,
    Object? status = null,
    Object? sellerStatus = null,
    Object? sellerType = freezed,
    Object? rejectReason = freezed,
    Object? inActiveReason = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      businessDetails: null == businessDetails
          ? _value.businessDetails
          : businessDetails // ignore: cast_nullable_to_non_nullable
              as String,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
      hasRegistered: null == hasRegistered
          ? _value.hasRegistered
          : hasRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      spid: null == spid
          ? _value.spid
          : spid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sellerStatus: null == sellerStatus
          ? _value.sellerStatus
          : sellerStatus // ignore: cast_nullable_to_non_nullable
              as String,
      sellerType: freezed == sellerType
          ? _value.sellerType
          : sellerType // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      inActiveReason: freezed == inActiveReason
          ? _value.inActiveReason
          : inActiveReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerStatusModelImplCopyWith<$Res>
    implements $SellerStatusModelCopyWith<$Res> {
  factory _$$SellerStatusModelImplCopyWith(_$SellerStatusModelImpl value,
          $Res Function(_$SellerStatusModelImpl) then) =
      __$$SellerStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String userId,
      String fullName,
      String email,
      String businessDetails,
      List<Document> documents,
      bool hasRegistered,
      @JsonKey(name: "SPID") String spid,
      String status,
      String sellerStatus,
      String? sellerType,
      String? rejectReason,
      String? inActiveReason});
}

/// @nodoc
class __$$SellerStatusModelImplCopyWithImpl<$Res>
    extends _$SellerStatusModelCopyWithImpl<$Res, _$SellerStatusModelImpl>
    implements _$$SellerStatusModelImplCopyWith<$Res> {
  __$$SellerStatusModelImplCopyWithImpl(_$SellerStatusModelImpl _value,
      $Res Function(_$SellerStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? fullName = null,
    Object? email = null,
    Object? businessDetails = null,
    Object? documents = null,
    Object? hasRegistered = null,
    Object? spid = null,
    Object? status = null,
    Object? sellerStatus = null,
    Object? sellerType = freezed,
    Object? rejectReason = freezed,
    Object? inActiveReason = freezed,
  }) {
    return _then(_$SellerStatusModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      businessDetails: null == businessDetails
          ? _value.businessDetails
          : businessDetails // ignore: cast_nullable_to_non_nullable
              as String,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
      hasRegistered: null == hasRegistered
          ? _value.hasRegistered
          : hasRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      spid: null == spid
          ? _value.spid
          : spid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sellerStatus: null == sellerStatus
          ? _value.sellerStatus
          : sellerStatus // ignore: cast_nullable_to_non_nullable
              as String,
      sellerType: freezed == sellerType
          ? _value.sellerType
          : sellerType // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      inActiveReason: freezed == inActiveReason
          ? _value.inActiveReason
          : inActiveReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerStatusModelImpl implements _SellerStatusModel {
  const _$SellerStatusModelImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.userId,
      required this.fullName,
      required this.email,
      required this.businessDetails,
      required final List<Document> documents,
      required this.hasRegistered,
      @JsonKey(name: "SPID") required this.spid,
      required this.status,
      required this.sellerStatus,
      this.sellerType,
      this.rejectReason,
      this.inActiveReason})
      : _documents = documents;

  factory _$SellerStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerStatusModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String userId;
  @override
  final String fullName;
  @override
  final String email;
  @override
  final String businessDetails;
  final List<Document> _documents;
  @override
  List<Document> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final bool hasRegistered;
  @override
  @JsonKey(name: "SPID")
  final String spid;
  @override
  final String status;
  @override
  final String sellerStatus;
  @override
  final String? sellerType;
  @override
  final String? rejectReason;
  @override
  final String? inActiveReason;

  @override
  String toString() {
    return 'SellerStatusModel(id: $id, userId: $userId, fullName: $fullName, email: $email, businessDetails: $businessDetails, documents: $documents, hasRegistered: $hasRegistered, spid: $spid, status: $status, sellerStatus: $sellerStatus, sellerType: $sellerType, rejectReason: $rejectReason, inActiveReason: $inActiveReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerStatusModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.businessDetails, businessDetails) ||
                other.businessDetails == businessDetails) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.hasRegistered, hasRegistered) ||
                other.hasRegistered == hasRegistered) &&
            (identical(other.spid, spid) || other.spid == spid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sellerStatus, sellerStatus) ||
                other.sellerStatus == sellerStatus) &&
            (identical(other.sellerType, sellerType) ||
                other.sellerType == sellerType) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.inActiveReason, inActiveReason) ||
                other.inActiveReason == inActiveReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      fullName,
      email,
      businessDetails,
      const DeepCollectionEquality().hash(_documents),
      hasRegistered,
      spid,
      status,
      sellerStatus,
      sellerType,
      rejectReason,
      inActiveReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerStatusModelImplCopyWith<_$SellerStatusModelImpl> get copyWith =>
      __$$SellerStatusModelImplCopyWithImpl<_$SellerStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerStatusModelImplToJson(
      this,
    );
  }
}

abstract class _SellerStatusModel implements SellerStatusModel {
  const factory _SellerStatusModel(
      {@JsonKey(name: "_id") required final String id,
      required final String userId,
      required final String fullName,
      required final String email,
      required final String businessDetails,
      required final List<Document> documents,
      required final bool hasRegistered,
      @JsonKey(name: "SPID") required final String spid,
      required final String status,
      required final String sellerStatus,
      final String? sellerType,
      final String? rejectReason,
      final String? inActiveReason}) = _$SellerStatusModelImpl;

  factory _SellerStatusModel.fromJson(Map<String, dynamic> json) =
      _$SellerStatusModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get userId;
  @override
  String get fullName;
  @override
  String get email;
  @override
  String get businessDetails;
  @override
  List<Document> get documents;
  @override
  bool get hasRegistered;
  @override
  @JsonKey(name: "SPID")
  String get spid;
  @override
  String get status;
  @override
  String get sellerStatus;
  @override
  String? get sellerType;
  @override
  String? get rejectReason;
  @override
  String? get inActiveReason;
  @override
  @JsonKey(ignore: true)
  _$$SellerStatusModelImplCopyWith<_$SellerStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
mixin _$Document {
  String get mediaUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call({String mediaUrl});
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrl = null,
  }) {
    return _then(_value.copyWith(
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentImplCopyWith<$Res>
    implements $DocumentCopyWith<$Res> {
  factory _$$DocumentImplCopyWith(
          _$DocumentImpl value, $Res Function(_$DocumentImpl) then) =
      __$$DocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mediaUrl});
}

/// @nodoc
class __$$DocumentImplCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$DocumentImpl>
    implements _$$DocumentImplCopyWith<$Res> {
  __$$DocumentImplCopyWithImpl(
      _$DocumentImpl _value, $Res Function(_$DocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrl = null,
  }) {
    return _then(_$DocumentImpl(
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentImpl implements _Document {
  const _$DocumentImpl({required this.mediaUrl});

  factory _$DocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentImplFromJson(json);

  @override
  final String mediaUrl;

  @override
  String toString() {
    return 'Document(mediaUrl: $mediaUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentImpl &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mediaUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      __$$DocumentImplCopyWithImpl<_$DocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentImplToJson(
      this,
    );
  }
}

abstract class _Document implements Document {
  const factory _Document({required final String mediaUrl}) = _$DocumentImpl;

  factory _Document.fromJson(Map<String, dynamic> json) =
      _$DocumentImpl.fromJson;

  @override
  String get mediaUrl;
  @override
  @JsonKey(ignore: true)
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
