// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'found_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoundPlaceEntity {

 double get relevanceScore; PlaceEntity get place;
/// Create a copy of FoundPlaceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoundPlaceEntityCopyWith<FoundPlaceEntity> get copyWith => _$FoundPlaceEntityCopyWithImpl<FoundPlaceEntity>(this as FoundPlaceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoundPlaceEntity&&(identical(other.relevanceScore, relevanceScore) || other.relevanceScore == relevanceScore)&&(identical(other.place, place) || other.place == place));
}


@override
int get hashCode => Object.hash(runtimeType,relevanceScore,place);

@override
String toString() {
  return 'FoundPlaceEntity(relevanceScore: $relevanceScore, place: $place)';
}


}

/// @nodoc
abstract mixin class $FoundPlaceEntityCopyWith<$Res>  {
  factory $FoundPlaceEntityCopyWith(FoundPlaceEntity value, $Res Function(FoundPlaceEntity) _then) = _$FoundPlaceEntityCopyWithImpl;
@useResult
$Res call({
 double relevanceScore, PlaceEntity place
});


$PlaceEntityCopyWith<$Res> get place;

}
/// @nodoc
class _$FoundPlaceEntityCopyWithImpl<$Res>
    implements $FoundPlaceEntityCopyWith<$Res> {
  _$FoundPlaceEntityCopyWithImpl(this._self, this._then);

  final FoundPlaceEntity _self;
  final $Res Function(FoundPlaceEntity) _then;

/// Create a copy of FoundPlaceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? relevanceScore = null,Object? place = null,}) {
  return _then(_self.copyWith(
relevanceScore: null == relevanceScore ? _self.relevanceScore : relevanceScore // ignore: cast_nullable_to_non_nullable
as double,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceEntity,
  ));
}
/// Create a copy of FoundPlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceEntityCopyWith<$Res> get place {
  
  return $PlaceEntityCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}


/// Adds pattern-matching-related methods to [FoundPlaceEntity].
extension FoundPlaceEntityPatterns on FoundPlaceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoundPlaceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoundPlaceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoundPlaceEntity value)  $default,){
final _that = this;
switch (_that) {
case _FoundPlaceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoundPlaceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FoundPlaceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double relevanceScore,  PlaceEntity place)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoundPlaceEntity() when $default != null:
return $default(_that.relevanceScore,_that.place);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double relevanceScore,  PlaceEntity place)  $default,) {final _that = this;
switch (_that) {
case _FoundPlaceEntity():
return $default(_that.relevanceScore,_that.place);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double relevanceScore,  PlaceEntity place)?  $default,) {final _that = this;
switch (_that) {
case _FoundPlaceEntity() when $default != null:
return $default(_that.relevanceScore,_that.place);case _:
  return null;

}
}

}

/// @nodoc


class _FoundPlaceEntity extends FoundPlaceEntity {
  const _FoundPlaceEntity({required this.relevanceScore, required this.place}): super._();
  

@override final  double relevanceScore;
@override final  PlaceEntity place;

/// Create a copy of FoundPlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoundPlaceEntityCopyWith<_FoundPlaceEntity> get copyWith => __$FoundPlaceEntityCopyWithImpl<_FoundPlaceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoundPlaceEntity&&(identical(other.relevanceScore, relevanceScore) || other.relevanceScore == relevanceScore)&&(identical(other.place, place) || other.place == place));
}


@override
int get hashCode => Object.hash(runtimeType,relevanceScore,place);

@override
String toString() {
  return 'FoundPlaceEntity(relevanceScore: $relevanceScore, place: $place)';
}


}

/// @nodoc
abstract mixin class _$FoundPlaceEntityCopyWith<$Res> implements $FoundPlaceEntityCopyWith<$Res> {
  factory _$FoundPlaceEntityCopyWith(_FoundPlaceEntity value, $Res Function(_FoundPlaceEntity) _then) = __$FoundPlaceEntityCopyWithImpl;
@override @useResult
$Res call({
 double relevanceScore, PlaceEntity place
});


@override $PlaceEntityCopyWith<$Res> get place;

}
/// @nodoc
class __$FoundPlaceEntityCopyWithImpl<$Res>
    implements _$FoundPlaceEntityCopyWith<$Res> {
  __$FoundPlaceEntityCopyWithImpl(this._self, this._then);

  final _FoundPlaceEntity _self;
  final $Res Function(_FoundPlaceEntity) _then;

/// Create a copy of FoundPlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? relevanceScore = null,Object? place = null,}) {
  return _then(_FoundPlaceEntity(
relevanceScore: null == relevanceScore ? _self.relevanceScore : relevanceScore // ignore: cast_nullable_to_non_nullable
as double,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as PlaceEntity,
  ));
}

/// Create a copy of FoundPlaceEntity
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
