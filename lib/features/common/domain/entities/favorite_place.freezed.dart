// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoritePlaceEntity {

 PlaceEntity get place; DateTime? get likedAt;
/// Create a copy of FavoritePlaceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritePlaceEntityCopyWith<FavoritePlaceEntity> get copyWith => _$FavoritePlaceEntityCopyWithImpl<FavoritePlaceEntity>(this as FavoritePlaceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritePlaceEntity&&(identical(other.place, place) || other.place == place)&&(identical(other.likedAt, likedAt) || other.likedAt == likedAt));
}


@override
int get hashCode => Object.hash(runtimeType,place,likedAt);

@override
String toString() {
  return 'FavoritePlaceEntity(place: $place, likedAt: $likedAt)';
}


}

/// @nodoc
abstract mixin class $FavoritePlaceEntityCopyWith<$Res>  {
  factory $FavoritePlaceEntityCopyWith(FavoritePlaceEntity value, $Res Function(FavoritePlaceEntity) _then) = _$FavoritePlaceEntityCopyWithImpl;
@useResult
$Res call({
 PlaceEntity place, DateTime? likedAt
});


$PlaceEntityCopyWith<$Res> get place;

}
/// @nodoc
class _$FavoritePlaceEntityCopyWithImpl<$Res>
    implements $FavoritePlaceEntityCopyWith<$Res> {
  _$FavoritePlaceEntityCopyWithImpl(this._self, this._then);

  final FavoritePlaceEntity _self;
  final $Res Function(FavoritePlaceEntity) _then;

/// Create a copy of FavoritePlaceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? place = null,Object? likedAt = freezed,}) {
  return _then(_self.copyWith(
place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceEntity,likedAt: freezed == likedAt ? _self.likedAt : likedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of FavoritePlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceEntityCopyWith<$Res> get place {
  
  return $PlaceEntityCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}


/// Adds pattern-matching-related methods to [FavoritePlaceEntity].
extension FavoritePlaceEntityPatterns on FavoritePlaceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoritePlaceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoritePlaceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoritePlaceEntity value)  $default,){
final _that = this;
switch (_that) {
case _FavoritePlaceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoritePlaceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FavoritePlaceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlaceEntity place,  DateTime? likedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoritePlaceEntity() when $default != null:
return $default(_that.place,_that.likedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlaceEntity place,  DateTime? likedAt)  $default,) {final _that = this;
switch (_that) {
case _FavoritePlaceEntity():
return $default(_that.place,_that.likedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlaceEntity place,  DateTime? likedAt)?  $default,) {final _that = this;
switch (_that) {
case _FavoritePlaceEntity() when $default != null:
return $default(_that.place,_that.likedAt);case _:
  return null;

}
}

}

/// @nodoc


class _FavoritePlaceEntity extends FavoritePlaceEntity {
  const _FavoritePlaceEntity({required this.place, required this.likedAt}): super._();
  

@override final  PlaceEntity place;
@override final  DateTime? likedAt;

/// Create a copy of FavoritePlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritePlaceEntityCopyWith<_FavoritePlaceEntity> get copyWith => __$FavoritePlaceEntityCopyWithImpl<_FavoritePlaceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritePlaceEntity&&(identical(other.place, place) || other.place == place)&&(identical(other.likedAt, likedAt) || other.likedAt == likedAt));
}


@override
int get hashCode => Object.hash(runtimeType,place,likedAt);

@override
String toString() {
  return 'FavoritePlaceEntity(place: $place, likedAt: $likedAt)';
}


}

/// @nodoc
abstract mixin class _$FavoritePlaceEntityCopyWith<$Res> implements $FavoritePlaceEntityCopyWith<$Res> {
  factory _$FavoritePlaceEntityCopyWith(_FavoritePlaceEntity value, $Res Function(_FavoritePlaceEntity) _then) = __$FavoritePlaceEntityCopyWithImpl;
@override @useResult
$Res call({
 PlaceEntity place, DateTime? likedAt
});


@override $PlaceEntityCopyWith<$Res> get place;

}
/// @nodoc
class __$FavoritePlaceEntityCopyWithImpl<$Res>
    implements _$FavoritePlaceEntityCopyWith<$Res> {
  __$FavoritePlaceEntityCopyWithImpl(this._self, this._then);

  final _FavoritePlaceEntity _self;
  final $Res Function(_FavoritePlaceEntity) _then;

/// Create a copy of FavoritePlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? place = null,Object? likedAt = freezed,}) {
  return _then(_FavoritePlaceEntity(
place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceEntity,likedAt: freezed == likedAt ? _self.likedAt : likedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of FavoritePlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceEntityCopyWith<$Res> get place {
  
  return $PlaceEntityCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}

// dart format on
