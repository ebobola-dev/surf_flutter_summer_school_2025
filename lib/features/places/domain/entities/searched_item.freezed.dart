// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searched_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchedItemEntity {

 String get query; DateTime get requestedAt;
/// Create a copy of SearchedItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchedItemEntityCopyWith<SearchedItemEntity> get copyWith => _$SearchedItemEntityCopyWithImpl<SearchedItemEntity>(this as SearchedItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchedItemEntity&&(identical(other.query, query) || other.query == query)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}


@override
int get hashCode => Object.hash(runtimeType,query,requestedAt);

@override
String toString() {
  return 'SearchedItemEntity(query: $query, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class $SearchedItemEntityCopyWith<$Res>  {
  factory $SearchedItemEntityCopyWith(SearchedItemEntity value, $Res Function(SearchedItemEntity) _then) = _$SearchedItemEntityCopyWithImpl;
@useResult
$Res call({
 String query, DateTime requestedAt
});




}
/// @nodoc
class _$SearchedItemEntityCopyWithImpl<$Res>
    implements $SearchedItemEntityCopyWith<$Res> {
  _$SearchedItemEntityCopyWithImpl(this._self, this._then);

  final SearchedItemEntity _self;
  final $Res Function(SearchedItemEntity) _then;

/// Create a copy of SearchedItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? requestedAt = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchedItemEntity].
extension SearchedItemEntityPatterns on SearchedItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchedItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchedItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchedItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _SearchedItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchedItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SearchedItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  DateTime requestedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchedItemEntity() when $default != null:
return $default(_that.query,_that.requestedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  DateTime requestedAt)  $default,) {final _that = this;
switch (_that) {
case _SearchedItemEntity():
return $default(_that.query,_that.requestedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  DateTime requestedAt)?  $default,) {final _that = this;
switch (_that) {
case _SearchedItemEntity() when $default != null:
return $default(_that.query,_that.requestedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SearchedItemEntity extends SearchedItemEntity {
  const _SearchedItemEntity({required this.query, required this.requestedAt}): super._();
  

@override final  String query;
@override final  DateTime requestedAt;

/// Create a copy of SearchedItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchedItemEntityCopyWith<_SearchedItemEntity> get copyWith => __$SearchedItemEntityCopyWithImpl<_SearchedItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchedItemEntity&&(identical(other.query, query) || other.query == query)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}


@override
int get hashCode => Object.hash(runtimeType,query,requestedAt);

@override
String toString() {
  return 'SearchedItemEntity(query: $query, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class _$SearchedItemEntityCopyWith<$Res> implements $SearchedItemEntityCopyWith<$Res> {
  factory _$SearchedItemEntityCopyWith(_SearchedItemEntity value, $Res Function(_SearchedItemEntity) _then) = __$SearchedItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String query, DateTime requestedAt
});




}
/// @nodoc
class __$SearchedItemEntityCopyWithImpl<$Res>
    implements _$SearchedItemEntityCopyWith<$Res> {
  __$SearchedItemEntityCopyWithImpl(this._self, this._then);

  final _SearchedItemEntity _self;
  final $Res Function(_SearchedItemEntity) _then;

/// Create a copy of SearchedItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? requestedAt = null,}) {
  return _then(_SearchedItemEntity(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
