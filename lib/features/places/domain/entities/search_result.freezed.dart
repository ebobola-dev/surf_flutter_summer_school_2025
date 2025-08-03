// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchResultEntity {

 String get query; int get total; SortedMap<int, FoundPlaceEntity> get results;
/// Create a copy of SearchResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultEntityCopyWith<SearchResultEntity> get copyWith => _$SearchResultEntityCopyWithImpl<SearchResultEntity>(this as SearchResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultEntity&&(identical(other.query, query) || other.query == query)&&(identical(other.total, total) || other.total == total)&&(identical(other.results, results) || other.results == results));
}


@override
int get hashCode => Object.hash(runtimeType,query,total,results);

@override
String toString() {
  return 'SearchResultEntity(query: $query, total: $total, results: $results)';
}


}

/// @nodoc
abstract mixin class $SearchResultEntityCopyWith<$Res>  {
  factory $SearchResultEntityCopyWith(SearchResultEntity value, $Res Function(SearchResultEntity) _then) = _$SearchResultEntityCopyWithImpl;
@useResult
$Res call({
 String query, int total, SortedMap<int, FoundPlaceEntity> results
});


$SortedMapCopyWith<int, FoundPlaceEntity, $Res> get results;

}
/// @nodoc
class _$SearchResultEntityCopyWithImpl<$Res>
    implements $SearchResultEntityCopyWith<$Res> {
  _$SearchResultEntityCopyWithImpl(this._self, this._then);

  final SearchResultEntity _self;
  final $Res Function(SearchResultEntity) _then;

/// Create a copy of SearchResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? total = null,Object? results = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as SortedMap<int, FoundPlaceEntity>,
  ));
}
/// Create a copy of SearchResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SortedMapCopyWith<int, FoundPlaceEntity, $Res> get results {
  
  return $SortedMapCopyWith<int, FoundPlaceEntity, $Res>(_self.results, (value) {
    return _then(_self.copyWith(results: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchResultEntity].
extension SearchResultEntityPatterns on SearchResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  int total,  SortedMap<int, FoundPlaceEntity> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultEntity() when $default != null:
return $default(_that.query,_that.total,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  int total,  SortedMap<int, FoundPlaceEntity> results)  $default,) {final _that = this;
switch (_that) {
case _SearchResultEntity():
return $default(_that.query,_that.total,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  int total,  SortedMap<int, FoundPlaceEntity> results)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultEntity() when $default != null:
return $default(_that.query,_that.total,_that.results);case _:
  return null;

}
}

}

/// @nodoc


class _SearchResultEntity extends SearchResultEntity {
  const _SearchResultEntity({required this.query, required this.total, required this.results}): super._();
  

@override final  String query;
@override final  int total;
@override final  SortedMap<int, FoundPlaceEntity> results;

/// Create a copy of SearchResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultEntityCopyWith<_SearchResultEntity> get copyWith => __$SearchResultEntityCopyWithImpl<_SearchResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultEntity&&(identical(other.query, query) || other.query == query)&&(identical(other.total, total) || other.total == total)&&(identical(other.results, results) || other.results == results));
}


@override
int get hashCode => Object.hash(runtimeType,query,total,results);

@override
String toString() {
  return 'SearchResultEntity(query: $query, total: $total, results: $results)';
}


}

/// @nodoc
abstract mixin class _$SearchResultEntityCopyWith<$Res> implements $SearchResultEntityCopyWith<$Res> {
  factory _$SearchResultEntityCopyWith(_SearchResultEntity value, $Res Function(_SearchResultEntity) _then) = __$SearchResultEntityCopyWithImpl;
@override @useResult
$Res call({
 String query, int total, SortedMap<int, FoundPlaceEntity> results
});


@override $SortedMapCopyWith<int, FoundPlaceEntity, $Res> get results;

}
/// @nodoc
class __$SearchResultEntityCopyWithImpl<$Res>
    implements _$SearchResultEntityCopyWith<$Res> {
  __$SearchResultEntityCopyWithImpl(this._self, this._then);

  final _SearchResultEntity _self;
  final $Res Function(_SearchResultEntity) _then;

/// Create a copy of SearchResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? total = null,Object? results = null,}) {
  return _then(_SearchResultEntity(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as SortedMap<int, FoundPlaceEntity>,
  ));
}

/// Create a copy of SearchResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SortedMapCopyWith<int, FoundPlaceEntity, $Res> get results {
  
  return $SortedMapCopyWith<int, FoundPlaceEntity, $Res>(_self.results, (value) {
    return _then(_self.copyWith(results: value));
  });
}
}

// dart format on
