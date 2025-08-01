// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sorted_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SortedMap<TID,TData> {

 Map<TID, TData> get data; List<TID> get idOrderedList;
/// Create a copy of SortedMap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SortedMapCopyWith<TID, TData, SortedMap<TID, TData>> get copyWith => _$SortedMapCopyWithImpl<TID, TData, SortedMap<TID, TData>>(this as SortedMap<TID, TData>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortedMap<TID, TData>&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.idOrderedList, idOrderedList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(idOrderedList));

@override
String toString() {
  return 'SortedMap<$TID, $TData>(data: $data, idOrderedList: $idOrderedList)';
}


}

/// @nodoc
abstract mixin class $SortedMapCopyWith<TID,TData,$Res>  {
  factory $SortedMapCopyWith(SortedMap<TID, TData> value, $Res Function(SortedMap<TID, TData>) _then) = _$SortedMapCopyWithImpl;
@useResult
$Res call({
 Map<TID, TData> data, List<TID> idOrderedList
});




}
/// @nodoc
class _$SortedMapCopyWithImpl<TID,TData,$Res>
    implements $SortedMapCopyWith<TID, TData, $Res> {
  _$SortedMapCopyWithImpl(this._self, this._then);

  final SortedMap<TID, TData> _self;
  final $Res Function(SortedMap<TID, TData>) _then;

/// Create a copy of SortedMap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? idOrderedList = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<TID, TData>,idOrderedList: null == idOrderedList ? _self.idOrderedList : idOrderedList // ignore: cast_nullable_to_non_nullable
as List<TID>,
  ));
}

}


/// Adds pattern-matching-related methods to [SortedMap].
extension SortedMapPatterns<TID,TData> on SortedMap<TID, TData> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SortedMap<TID, TData> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SortedMap() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SortedMap<TID, TData> value)  $default,){
final _that = this;
switch (_that) {
case _SortedMap():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SortedMap<TID, TData> value)?  $default,){
final _that = this;
switch (_that) {
case _SortedMap() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<TID, TData> data,  List<TID> idOrderedList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SortedMap() when $default != null:
return $default(_that.data,_that.idOrderedList);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<TID, TData> data,  List<TID> idOrderedList)  $default,) {final _that = this;
switch (_that) {
case _SortedMap():
return $default(_that.data,_that.idOrderedList);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<TID, TData> data,  List<TID> idOrderedList)?  $default,) {final _that = this;
switch (_that) {
case _SortedMap() when $default != null:
return $default(_that.data,_that.idOrderedList);case _:
  return null;

}
}

}

/// @nodoc


class _SortedMap<TID,TData> extends SortedMap<TID, TData> {
  const _SortedMap({final  Map<TID, TData> data = const {}, final  List<TID> idOrderedList = const []}): _data = data,_idOrderedList = idOrderedList,super._();
  

 final  Map<TID, TData> _data;
@override@JsonKey() Map<TID, TData> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

 final  List<TID> _idOrderedList;
@override@JsonKey() List<TID> get idOrderedList {
  if (_idOrderedList is EqualUnmodifiableListView) return _idOrderedList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_idOrderedList);
}


/// Create a copy of SortedMap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SortedMapCopyWith<TID, TData, _SortedMap<TID, TData>> get copyWith => __$SortedMapCopyWithImpl<TID, TData, _SortedMap<TID, TData>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SortedMap<TID, TData>&&const DeepCollectionEquality().equals(other._data, _data)&&const DeepCollectionEquality().equals(other._idOrderedList, _idOrderedList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),const DeepCollectionEquality().hash(_idOrderedList));

@override
String toString() {
  return 'SortedMap<$TID, $TData>(data: $data, idOrderedList: $idOrderedList)';
}


}

/// @nodoc
abstract mixin class _$SortedMapCopyWith<TID,TData,$Res> implements $SortedMapCopyWith<TID, TData, $Res> {
  factory _$SortedMapCopyWith(_SortedMap<TID, TData> value, $Res Function(_SortedMap<TID, TData>) _then) = __$SortedMapCopyWithImpl;
@override @useResult
$Res call({
 Map<TID, TData> data, List<TID> idOrderedList
});




}
/// @nodoc
class __$SortedMapCopyWithImpl<TID,TData,$Res>
    implements _$SortedMapCopyWith<TID, TData, $Res> {
  __$SortedMapCopyWithImpl(this._self, this._then);

  final _SortedMap<TID, TData> _self;
  final $Res Function(_SortedMap<TID, TData>) _then;

/// Create a copy of SortedMap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? idOrderedList = null,}) {
  return _then(_SortedMap<TID, TData>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<TID, TData>,idOrderedList: null == idOrderedList ? _self._idOrderedList : idOrderedList // ignore: cast_nullable_to_non_nullable
as List<TID>,
  ));
}


}

// dart format on
