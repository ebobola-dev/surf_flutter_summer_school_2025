// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DistanceFilter {

 int get min; int get max;
/// Create a copy of DistanceFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistanceFilterCopyWith<DistanceFilter> get copyWith => _$DistanceFilterCopyWithImpl<DistanceFilter>(this as DistanceFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistanceFilter&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}


@override
int get hashCode => Object.hash(runtimeType,min,max);

@override
String toString() {
  return 'DistanceFilter(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class $DistanceFilterCopyWith<$Res>  {
  factory $DistanceFilterCopyWith(DistanceFilter value, $Res Function(DistanceFilter) _then) = _$DistanceFilterCopyWithImpl;
@useResult
$Res call({
 int min, int max
});




}
/// @nodoc
class _$DistanceFilterCopyWithImpl<$Res>
    implements $DistanceFilterCopyWith<$Res> {
  _$DistanceFilterCopyWithImpl(this._self, this._then);

  final DistanceFilter _self;
  final $Res Function(DistanceFilter) _then;

/// Create a copy of DistanceFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,}) {
  return _then(_self.copyWith(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DistanceFilter].
extension DistanceFilterPatterns on DistanceFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistanceFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistanceFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistanceFilter value)  $default,){
final _that = this;
switch (_that) {
case _DistanceFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistanceFilter value)?  $default,){
final _that = this;
switch (_that) {
case _DistanceFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int min,  int max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistanceFilter() when $default != null:
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int min,  int max)  $default,) {final _that = this;
switch (_that) {
case _DistanceFilter():
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int min,  int max)?  $default,) {final _that = this;
switch (_that) {
case _DistanceFilter() when $default != null:
return $default(_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc


class _DistanceFilter extends DistanceFilter {
  const _DistanceFilter({required this.min, required this.max}): super._();
  

@override final  int min;
@override final  int max;

/// Create a copy of DistanceFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistanceFilterCopyWith<_DistanceFilter> get copyWith => __$DistanceFilterCopyWithImpl<_DistanceFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistanceFilter&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}


@override
int get hashCode => Object.hash(runtimeType,min,max);

@override
String toString() {
  return 'DistanceFilter(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$DistanceFilterCopyWith<$Res> implements $DistanceFilterCopyWith<$Res> {
  factory _$DistanceFilterCopyWith(_DistanceFilter value, $Res Function(_DistanceFilter) _then) = __$DistanceFilterCopyWithImpl;
@override @useResult
$Res call({
 int min, int max
});




}
/// @nodoc
class __$DistanceFilterCopyWithImpl<$Res>
    implements _$DistanceFilterCopyWith<$Res> {
  __$DistanceFilterCopyWithImpl(this._self, this._then);

  final _DistanceFilter _self;
  final $Res Function(_DistanceFilter) _then;

/// Create a copy of DistanceFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,}) {
  return _then(_DistanceFilter(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
