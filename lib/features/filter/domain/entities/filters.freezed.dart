// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterSettings {

 DistanceFilter get distance; Set<Categories> get categories;
/// Create a copy of FilterSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterSettingsCopyWith<FilterSettings> get copyWith => _$FilterSettingsCopyWithImpl<FilterSettings>(this as FilterSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterSettings&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,distance,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'FilterSettings(distance: $distance, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $FilterSettingsCopyWith<$Res>  {
  factory $FilterSettingsCopyWith(FilterSettings value, $Res Function(FilterSettings) _then) = _$FilterSettingsCopyWithImpl;
@useResult
$Res call({
 DistanceFilter distance, Set<Categories> categories
});


$DistanceFilterCopyWith<$Res> get distance;

}
/// @nodoc
class _$FilterSettingsCopyWithImpl<$Res>
    implements $FilterSettingsCopyWith<$Res> {
  _$FilterSettingsCopyWithImpl(this._self, this._then);

  final FilterSettings _self;
  final $Res Function(FilterSettings) _then;

/// Create a copy of FilterSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? distance = null,Object? categories = null,}) {
  return _then(_self.copyWith(
distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as DistanceFilter,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as Set<Categories>,
  ));
}
/// Create a copy of FilterSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistanceFilterCopyWith<$Res> get distance {
  
  return $DistanceFilterCopyWith<$Res>(_self.distance, (value) {
    return _then(_self.copyWith(distance: value));
  });
}
}


/// Adds pattern-matching-related methods to [FilterSettings].
extension FilterSettingsPatterns on FilterSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterSettings value)  $default,){
final _that = this;
switch (_that) {
case _FilterSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterSettings value)?  $default,){
final _that = this;
switch (_that) {
case _FilterSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DistanceFilter distance,  Set<Categories> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterSettings() when $default != null:
return $default(_that.distance,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DistanceFilter distance,  Set<Categories> categories)  $default,) {final _that = this;
switch (_that) {
case _FilterSettings():
return $default(_that.distance,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DistanceFilter distance,  Set<Categories> categories)?  $default,) {final _that = this;
switch (_that) {
case _FilterSettings() when $default != null:
return $default(_that.distance,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _FilterSettings extends FilterSettings {
  const _FilterSettings({required this.distance, required final  Set<Categories> categories}): _categories = categories,super._();
  

@override final  DistanceFilter distance;
 final  Set<Categories> _categories;
@override Set<Categories> get categories {
  if (_categories is EqualUnmodifiableSetView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_categories);
}


/// Create a copy of FilterSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterSettingsCopyWith<_FilterSettings> get copyWith => __$FilterSettingsCopyWithImpl<_FilterSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterSettings&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,distance,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'FilterSettings(distance: $distance, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$FilterSettingsCopyWith<$Res> implements $FilterSettingsCopyWith<$Res> {
  factory _$FilterSettingsCopyWith(_FilterSettings value, $Res Function(_FilterSettings) _then) = __$FilterSettingsCopyWithImpl;
@override @useResult
$Res call({
 DistanceFilter distance, Set<Categories> categories
});


@override $DistanceFilterCopyWith<$Res> get distance;

}
/// @nodoc
class __$FilterSettingsCopyWithImpl<$Res>
    implements _$FilterSettingsCopyWith<$Res> {
  __$FilterSettingsCopyWithImpl(this._self, this._then);

  final _FilterSettings _self;
  final $Res Function(_FilterSettings) _then;

/// Create a copy of FilterSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? distance = null,Object? categories = null,}) {
  return _then(_FilterSettings(
distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as DistanceFilter,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as Set<Categories>,
  ));
}

/// Create a copy of FilterSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistanceFilterCopyWith<$Res> get distance {
  
  return $DistanceFilterCopyWith<$Res>(_self.distance, (value) {
    return _then(_self.copyWith(distance: value));
  });
}
}

// dart format on
