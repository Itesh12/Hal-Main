// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserNotificationModel _$UserNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _UserNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$UserNotificationModel {
  List<ListElement> get list => throw _privateConstructorUsedError;
  int get unreadNotifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserNotificationModelCopyWith<UserNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNotificationModelCopyWith<$Res> {
  factory $UserNotificationModelCopyWith(UserNotificationModel value,
          $Res Function(UserNotificationModel) then) =
      _$UserNotificationModelCopyWithImpl<$Res, UserNotificationModel>;
  @useResult
  $Res call({List<ListElement> list, int unreadNotifications});
}

/// @nodoc
class _$UserNotificationModelCopyWithImpl<$Res,
        $Val extends UserNotificationModel>
    implements $UserNotificationModelCopyWith<$Res> {
  _$UserNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? unreadNotifications = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ListElement>,
      unreadNotifications: null == unreadNotifications
          ? _value.unreadNotifications
          : unreadNotifications // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserNotificationModelImplCopyWith<$Res>
    implements $UserNotificationModelCopyWith<$Res> {
  factory _$$UserNotificationModelImplCopyWith(
          _$UserNotificationModelImpl value,
          $Res Function(_$UserNotificationModelImpl) then) =
      __$$UserNotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ListElement> list, int unreadNotifications});
}

/// @nodoc
class __$$UserNotificationModelImplCopyWithImpl<$Res>
    extends _$UserNotificationModelCopyWithImpl<$Res,
        _$UserNotificationModelImpl>
    implements _$$UserNotificationModelImplCopyWith<$Res> {
  __$$UserNotificationModelImplCopyWithImpl(_$UserNotificationModelImpl _value,
      $Res Function(_$UserNotificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? unreadNotifications = null,
  }) {
    return _then(_$UserNotificationModelImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ListElement>,
      unreadNotifications: null == unreadNotifications
          ? _value.unreadNotifications
          : unreadNotifications // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserNotificationModelImpl implements _UserNotificationModel {
  const _$UserNotificationModelImpl(
      {required final List<ListElement> list,
      required this.unreadNotifications})
      : _list = list;

  factory _$UserNotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserNotificationModelImplFromJson(json);

  final List<ListElement> _list;
  @override
  List<ListElement> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final int unreadNotifications;

  @override
  String toString() {
    return 'UserNotificationModel(list: $list, unreadNotifications: $unreadNotifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNotificationModelImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.unreadNotifications, unreadNotifications) ||
                other.unreadNotifications == unreadNotifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_list), unreadNotifications);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNotificationModelImplCopyWith<_$UserNotificationModelImpl>
      get copyWith => __$$UserNotificationModelImplCopyWithImpl<
          _$UserNotificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserNotificationModelImplToJson(
      this,
    );
  }
}

abstract class _UserNotificationModel implements UserNotificationModel {
  const factory _UserNotificationModel(
      {required final List<ListElement> list,
      required final int unreadNotifications}) = _$UserNotificationModelImpl;

  factory _UserNotificationModel.fromJson(Map<String, dynamic> json) =
      _$UserNotificationModelImpl.fromJson;

  @override
  List<ListElement> get list;
  @override
  int get unreadNotifications;
  @override
  @JsonKey(ignore: true)
  _$$UserNotificationModelImplCopyWith<_$UserNotificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ListElement _$ListElementFromJson(Map<String, dynamic> json) {
  return _ListElement.fromJson(json);
}

/// @nodoc
mixin _$ListElement {
  Notification get notification => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  bool get view => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListElementCopyWith<ListElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListElementCopyWith<$Res> {
  factory $ListElementCopyWith(
          ListElement value, $Res Function(ListElement) then) =
      _$ListElementCopyWithImpl<$Res, ListElement>;
  @useResult
  $Res call(
      {Notification notification,
      Data data,
      @JsonKey(name: "_id") String id,
      bool view});

  $NotificationCopyWith<$Res> get notification;
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$ListElementCopyWithImpl<$Res, $Val extends ListElement>
    implements $ListElementCopyWith<$Res> {
  _$ListElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
    Object? data = null,
    Object? id = null,
    Object? view = null,
  }) {
    return _then(_value.copyWith(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Notification,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationCopyWith<$Res> get notification {
    return $NotificationCopyWith<$Res>(_value.notification, (value) {
      return _then(_value.copyWith(notification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListElementImplCopyWith<$Res>
    implements $ListElementCopyWith<$Res> {
  factory _$$ListElementImplCopyWith(
          _$ListElementImpl value, $Res Function(_$ListElementImpl) then) =
      __$$ListElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Notification notification,
      Data data,
      @JsonKey(name: "_id") String id,
      bool view});

  @override
  $NotificationCopyWith<$Res> get notification;
  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ListElementImplCopyWithImpl<$Res>
    extends _$ListElementCopyWithImpl<$Res, _$ListElementImpl>
    implements _$$ListElementImplCopyWith<$Res> {
  __$$ListElementImplCopyWithImpl(
      _$ListElementImpl _value, $Res Function(_$ListElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
    Object? data = null,
    Object? id = null,
    Object? view = null,
  }) {
    return _then(_$ListElementImpl(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Notification,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListElementImpl implements _ListElement {
  const _$ListElementImpl(
      {required this.notification,
      required this.data,
      @JsonKey(name: "_id") required this.id,
      required this.view});

  factory _$ListElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListElementImplFromJson(json);

  @override
  final Notification notification;
  @override
  final Data data;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final bool view;

  @override
  String toString() {
    return 'ListElement(notification: $notification, data: $data, id: $id, view: $view)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListElementImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.view, view) || other.view == view));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notification, data, id, view);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListElementImplCopyWith<_$ListElementImpl> get copyWith =>
      __$$ListElementImplCopyWithImpl<_$ListElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListElementImplToJson(
      this,
    );
  }
}

abstract class _ListElement implements ListElement {
  const factory _ListElement(
      {required final Notification notification,
      required final Data data,
      @JsonKey(name: "_id") required final String id,
      required final bool view}) = _$ListElementImpl;

  factory _ListElement.fromJson(Map<String, dynamic> json) =
      _$ListElementImpl.fromJson;

  @override
  Notification get notification;
  @override
  Data get data;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  bool get view;
  @override
  @JsonKey(ignore: true)
  _$$ListElementImplCopyWith<_$ListElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get post => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get userImage => throw _privateConstructorUsedError;
  DateTime? get event_time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {String? post,
      String? route,
      String? image,
      String? userImage,
      DateTime? event_time});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = freezed,
    Object? route = freezed,
    Object? image = freezed,
    Object? userImage = freezed,
    Object? event_time = freezed,
  }) {
    return _then(_value.copyWith(
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      event_time: freezed == event_time
          ? _value.event_time
          : event_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? post,
      String? route,
      String? image,
      String? userImage,
      DateTime? event_time});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = freezed,
    Object? route = freezed,
    Object? image = freezed,
    Object? userImage = freezed,
    Object? event_time = freezed,
  }) {
    return _then(_$DataImpl(
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      event_time: freezed == event_time
          ? _value.event_time
          : event_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {required this.post,
      required this.route,
      required this.image,
      required this.userImage,
      required this.event_time});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final String? post;
  @override
  final String? route;
  @override
  final String? image;
  @override
  final String? userImage;
  @override
  final DateTime? event_time;

  @override
  String toString() {
    return 'Data(post: $post, route: $route, image: $image, userImage: $userImage, event_time: $event_time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.event_time, event_time) ||
                other.event_time == event_time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, post, route, image, userImage, event_time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {required final String? post,
      required final String? route,
      required final String? image,
      required final String? userImage,
      required final DateTime? event_time}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  String? get post;
  @override
  String? get route;
  @override
  String? get image;
  @override
  String? get userImage;
  @override
  DateTime? get event_time;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call({String? title, String? body, String? image});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? body, String? image});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? image = freezed,
  }) {
    return _then(_$NotificationImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {required this.title, required this.body, required this.image});

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? image;

  @override
  String toString() {
    return 'Notification(title: $title, body: $body, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, body, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {required final String? title,
      required final String? body,
      required final String? image}) = _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  String? get title;
  @override
  String? get body;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
