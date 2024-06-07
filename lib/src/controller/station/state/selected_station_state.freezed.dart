// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_station_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectedStationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NearByStaionListModel nearByStation) $default, {
    required TResult Function() alreadySelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NearByStaionListModel nearByStation)? $default, {
    TResult? Function()? alreadySelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NearByStaionListModel nearByStation)? $default, {
    TResult Function()? alreadySelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Selected value) $default, {
    required TResult Function(AlreadySelected value) alreadySelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Selected value)? $default, {
    TResult? Function(AlreadySelected value)? alreadySelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Selected value)? $default, {
    TResult Function(AlreadySelected value)? alreadySelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedStationStateCopyWith<$Res> {
  factory $SelectedStationStateCopyWith(SelectedStationState value,
          $Res Function(SelectedStationState) then) =
      _$SelectedStationStateCopyWithImpl<$Res, SelectedStationState>;
}

/// @nodoc
class _$SelectedStationStateCopyWithImpl<$Res,
        $Val extends SelectedStationState>
    implements $SelectedStationStateCopyWith<$Res> {
  _$SelectedStationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AlreadySelectedImplCopyWith<$Res> {
  factory _$$AlreadySelectedImplCopyWith(_$AlreadySelectedImpl value,
          $Res Function(_$AlreadySelectedImpl) then) =
      __$$AlreadySelectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlreadySelectedImplCopyWithImpl<$Res>
    extends _$SelectedStationStateCopyWithImpl<$Res, _$AlreadySelectedImpl>
    implements _$$AlreadySelectedImplCopyWith<$Res> {
  __$$AlreadySelectedImplCopyWithImpl(
      _$AlreadySelectedImpl _value, $Res Function(_$AlreadySelectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AlreadySelectedImpl implements AlreadySelected {
  const _$AlreadySelectedImpl();

  @override
  String toString() {
    return 'SelectedStationState.alreadySelected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlreadySelectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NearByStaionListModel nearByStation) $default, {
    required TResult Function() alreadySelected,
  }) {
    return alreadySelected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NearByStaionListModel nearByStation)? $default, {
    TResult? Function()? alreadySelected,
  }) {
    return alreadySelected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NearByStaionListModel nearByStation)? $default, {
    TResult Function()? alreadySelected,
    required TResult orElse(),
  }) {
    if (alreadySelected != null) {
      return alreadySelected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Selected value) $default, {
    required TResult Function(AlreadySelected value) alreadySelected,
  }) {
    return alreadySelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Selected value)? $default, {
    TResult? Function(AlreadySelected value)? alreadySelected,
  }) {
    return alreadySelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Selected value)? $default, {
    TResult Function(AlreadySelected value)? alreadySelected,
    required TResult orElse(),
  }) {
    if (alreadySelected != null) {
      return alreadySelected(this);
    }
    return orElse();
  }
}

abstract class AlreadySelected implements SelectedStationState {
  const factory AlreadySelected() = _$AlreadySelectedImpl;
}

/// @nodoc
abstract class _$$SelectedImplCopyWith<$Res> {
  factory _$$SelectedImplCopyWith(
          _$SelectedImpl value, $Res Function(_$SelectedImpl) then) =
      __$$SelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NearByStaionListModel nearByStation});

  $NearByStaionListModelCopyWith<$Res> get nearByStation;
}

/// @nodoc
class __$$SelectedImplCopyWithImpl<$Res>
    extends _$SelectedStationStateCopyWithImpl<$Res, _$SelectedImpl>
    implements _$$SelectedImplCopyWith<$Res> {
  __$$SelectedImplCopyWithImpl(
      _$SelectedImpl _value, $Res Function(_$SelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nearByStation = null,
  }) {
    return _then(_$SelectedImpl(
      null == nearByStation
          ? _value.nearByStation
          : nearByStation // ignore: cast_nullable_to_non_nullable
              as NearByStaionListModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NearByStaionListModelCopyWith<$Res> get nearByStation {
    return $NearByStaionListModelCopyWith<$Res>(_value.nearByStation, (value) {
      return _then(_value.copyWith(nearByStation: value));
    });
  }
}

/// @nodoc

class _$SelectedImpl implements Selected {
  const _$SelectedImpl(this.nearByStation);

  @override
  final NearByStaionListModel nearByStation;

  @override
  String toString() {
    return 'SelectedStationState(nearByStation: $nearByStation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedImpl &&
            (identical(other.nearByStation, nearByStation) ||
                other.nearByStation == nearByStation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nearByStation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedImplCopyWith<_$SelectedImpl> get copyWith =>
      __$$SelectedImplCopyWithImpl<_$SelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(NearByStaionListModel nearByStation) $default, {
    required TResult Function() alreadySelected,
  }) {
    return $default(nearByStation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(NearByStaionListModel nearByStation)? $default, {
    TResult? Function()? alreadySelected,
  }) {
    return $default?.call(nearByStation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(NearByStaionListModel nearByStation)? $default, {
    TResult Function()? alreadySelected,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(nearByStation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Selected value) $default, {
    required TResult Function(AlreadySelected value) alreadySelected,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Selected value)? $default, {
    TResult? Function(AlreadySelected value)? alreadySelected,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Selected value)? $default, {
    TResult Function(AlreadySelected value)? alreadySelected,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Selected implements SelectedStationState {
  const factory Selected(final NearByStaionListModel nearByStation) =
      _$SelectedImpl;

  NearByStaionListModel get nearByStation;
  @JsonKey(ignore: true)
  _$$SelectedImplCopyWith<_$SelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
