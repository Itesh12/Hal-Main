// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsListModel _$NewsListModelFromJson(Map<String, dynamic> json) {
  return _NewsListModel.fromJson(json);
}

/// @nodoc
mixin _$NewsListModel {
  String get status => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  List<TopNewsModel> get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsListModelCopyWith<NewsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsListModelCopyWith<$Res> {
  factory $NewsListModelCopyWith(
          NewsListModel value, $Res Function(NewsListModel) then) =
      _$NewsListModelCopyWithImpl<$Res, NewsListModel>;
  @useResult
  $Res call({String status, int totalResults, List<TopNewsModel> articles});
}

/// @nodoc
class _$NewsListModelCopyWithImpl<$Res, $Val extends NewsListModel>
    implements $NewsListModelCopyWith<$Res> {
  _$NewsListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<TopNewsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsListModelImplCopyWith<$Res>
    implements $NewsListModelCopyWith<$Res> {
  factory _$$NewsListModelImplCopyWith(
          _$NewsListModelImpl value, $Res Function(_$NewsListModelImpl) then) =
      __$$NewsListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int totalResults, List<TopNewsModel> articles});
}

/// @nodoc
class __$$NewsListModelImplCopyWithImpl<$Res>
    extends _$NewsListModelCopyWithImpl<$Res, _$NewsListModelImpl>
    implements _$$NewsListModelImplCopyWith<$Res> {
  __$$NewsListModelImplCopyWithImpl(
      _$NewsListModelImpl _value, $Res Function(_$NewsListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_$NewsListModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<TopNewsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsListModelImpl extends _NewsListModel {
  const _$NewsListModelImpl(
      {required this.status,
      required this.totalResults,
      required final List<TopNewsModel> articles})
      : _articles = articles,
        super._();

  factory _$NewsListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int totalResults;
  final List<TopNewsModel> _articles;
  @override
  List<TopNewsModel> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'NewsListModel(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, totalResults,
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsListModelImplCopyWith<_$NewsListModelImpl> get copyWith =>
      __$$NewsListModelImplCopyWithImpl<_$NewsListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsListModelImplToJson(
      this,
    );
  }
}

abstract class _NewsListModel extends NewsListModel {
  const factory _NewsListModel(
      {required final String status,
      required final int totalResults,
      required final List<TopNewsModel> articles}) = _$NewsListModelImpl;
  const _NewsListModel._() : super._();

  factory _NewsListModel.fromJson(Map<String, dynamic> json) =
      _$NewsListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get totalResults;
  @override
  List<TopNewsModel> get articles;
  @override
  @JsonKey(ignore: true)
  _$$NewsListModelImplCopyWith<_$NewsListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
