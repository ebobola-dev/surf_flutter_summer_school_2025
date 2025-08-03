// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 String get query;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchState(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BaseSearchState value)?  base,TResult Function( ProcessingSearchState value)?  processing,TResult Function( FoundSearchState value)?  found,TResult Function( NotFoundSearchState value)?  notFound,TResult Function( ErrorSearchState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BaseSearchState() when base != null:
return base(_that);case ProcessingSearchState() when processing != null:
return processing(_that);case FoundSearchState() when found != null:
return found(_that);case NotFoundSearchState() when notFound != null:
return notFound(_that);case ErrorSearchState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BaseSearchState value)  base,required TResult Function( ProcessingSearchState value)  processing,required TResult Function( FoundSearchState value)  found,required TResult Function( NotFoundSearchState value)  notFound,required TResult Function( ErrorSearchState value)  error,}){
final _that = this;
switch (_that) {
case BaseSearchState():
return base(_that);case ProcessingSearchState():
return processing(_that);case FoundSearchState():
return found(_that);case NotFoundSearchState():
return notFound(_that);case ErrorSearchState():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BaseSearchState value)?  base,TResult? Function( ProcessingSearchState value)?  processing,TResult? Function( FoundSearchState value)?  found,TResult? Function( NotFoundSearchState value)?  notFound,TResult? Function( ErrorSearchState value)?  error,}){
final _that = this;
switch (_that) {
case BaseSearchState() when base != null:
return base(_that);case ProcessingSearchState() when processing != null:
return processing(_that);case FoundSearchState() when found != null:
return found(_that);case NotFoundSearchState() when notFound != null:
return notFound(_that);case ErrorSearchState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  base,TResult Function( String query)?  processing,TResult Function( String query,  SearchResultEntity result,  bool isLoadingMore,  bool hasMore)?  found,TResult Function( String query)?  notFound,TResult Function( String query)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BaseSearchState() when base != null:
return base(_that.query);case ProcessingSearchState() when processing != null:
return processing(_that.query);case FoundSearchState() when found != null:
return found(_that.query,_that.result,_that.isLoadingMore,_that.hasMore);case NotFoundSearchState() when notFound != null:
return notFound(_that.query);case ErrorSearchState() when error != null:
return error(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  base,required TResult Function( String query)  processing,required TResult Function( String query,  SearchResultEntity result,  bool isLoadingMore,  bool hasMore)  found,required TResult Function( String query)  notFound,required TResult Function( String query)  error,}) {final _that = this;
switch (_that) {
case BaseSearchState():
return base(_that.query);case ProcessingSearchState():
return processing(_that.query);case FoundSearchState():
return found(_that.query,_that.result,_that.isLoadingMore,_that.hasMore);case NotFoundSearchState():
return notFound(_that.query);case ErrorSearchState():
return error(_that.query);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  base,TResult? Function( String query)?  processing,TResult? Function( String query,  SearchResultEntity result,  bool isLoadingMore,  bool hasMore)?  found,TResult? Function( String query)?  notFound,TResult? Function( String query)?  error,}) {final _that = this;
switch (_that) {
case BaseSearchState() when base != null:
return base(_that.query);case ProcessingSearchState() when processing != null:
return processing(_that.query);case FoundSearchState() when found != null:
return found(_that.query,_that.result,_that.isLoadingMore,_that.hasMore);case NotFoundSearchState() when notFound != null:
return notFound(_that.query);case ErrorSearchState() when error != null:
return error(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class BaseSearchState implements SearchState {
   BaseSearchState({this.query = ''});
  

@override@JsonKey() final  String query;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseSearchStateCopyWith<BaseSearchState> get copyWith => _$BaseSearchStateCopyWithImpl<BaseSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseSearchState&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchState.base(query: $query)';
}


}

/// @nodoc
abstract mixin class $BaseSearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $BaseSearchStateCopyWith(BaseSearchState value, $Res Function(BaseSearchState) _then) = _$BaseSearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query
});




}
/// @nodoc
class _$BaseSearchStateCopyWithImpl<$Res>
    implements $BaseSearchStateCopyWith<$Res> {
  _$BaseSearchStateCopyWithImpl(this._self, this._then);

  final BaseSearchState _self;
  final $Res Function(BaseSearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(BaseSearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProcessingSearchState implements SearchState {
   ProcessingSearchState({required this.query});
  

@override final  String query;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessingSearchStateCopyWith<ProcessingSearchState> get copyWith => _$ProcessingSearchStateCopyWithImpl<ProcessingSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessingSearchState&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchState.processing(query: $query)';
}


}

/// @nodoc
abstract mixin class $ProcessingSearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $ProcessingSearchStateCopyWith(ProcessingSearchState value, $Res Function(ProcessingSearchState) _then) = _$ProcessingSearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query
});




}
/// @nodoc
class _$ProcessingSearchStateCopyWithImpl<$Res>
    implements $ProcessingSearchStateCopyWith<$Res> {
  _$ProcessingSearchStateCopyWithImpl(this._self, this._then);

  final ProcessingSearchState _self;
  final $Res Function(ProcessingSearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(ProcessingSearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FoundSearchState implements SearchState {
   FoundSearchState({required this.query, required this.result, this.isLoadingMore = false, this.hasMore = true});
  

@override final  String query;
 final  SearchResultEntity result;
@JsonKey() final  bool isLoadingMore;
@JsonKey() final  bool hasMore;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoundSearchStateCopyWith<FoundSearchState> get copyWith => _$FoundSearchStateCopyWithImpl<FoundSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoundSearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.result, result) || other.result == result)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,query,result,isLoadingMore,hasMore);

@override
String toString() {
  return 'SearchState.found(query: $query, result: $result, isLoadingMore: $isLoadingMore, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $FoundSearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $FoundSearchStateCopyWith(FoundSearchState value, $Res Function(FoundSearchState) _then) = _$FoundSearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query, SearchResultEntity result, bool isLoadingMore, bool hasMore
});


$SearchResultEntityCopyWith<$Res> get result;

}
/// @nodoc
class _$FoundSearchStateCopyWithImpl<$Res>
    implements $FoundSearchStateCopyWith<$Res> {
  _$FoundSearchStateCopyWithImpl(this._self, this._then);

  final FoundSearchState _self;
  final $Res Function(FoundSearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? result = null,Object? isLoadingMore = null,Object? hasMore = null,}) {
  return _then(FoundSearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as SearchResultEntity,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultEntityCopyWith<$Res> get result {
  
  return $SearchResultEntityCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class NotFoundSearchState implements SearchState {
   NotFoundSearchState({required this.query});
  

@override final  String query;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundSearchStateCopyWith<NotFoundSearchState> get copyWith => _$NotFoundSearchStateCopyWithImpl<NotFoundSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundSearchState&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchState.notFound(query: $query)';
}


}

/// @nodoc
abstract mixin class $NotFoundSearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $NotFoundSearchStateCopyWith(NotFoundSearchState value, $Res Function(NotFoundSearchState) _then) = _$NotFoundSearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query
});




}
/// @nodoc
class _$NotFoundSearchStateCopyWithImpl<$Res>
    implements $NotFoundSearchStateCopyWith<$Res> {
  _$NotFoundSearchStateCopyWithImpl(this._self, this._then);

  final NotFoundSearchState _self;
  final $Res Function(NotFoundSearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(NotFoundSearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorSearchState implements SearchState {
   ErrorSearchState({required this.query});
  

@override final  String query;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorSearchStateCopyWith<ErrorSearchState> get copyWith => _$ErrorSearchStateCopyWithImpl<ErrorSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorSearchState&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchState.error(query: $query)';
}


}

/// @nodoc
abstract mixin class $ErrorSearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $ErrorSearchStateCopyWith(ErrorSearchState value, $Res Function(ErrorSearchState) _then) = _$ErrorSearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query
});




}
/// @nodoc
class _$ErrorSearchStateCopyWithImpl<$Res>
    implements $ErrorSearchStateCopyWith<$Res> {
  _$ErrorSearchStateCopyWithImpl(this._self, this._then);

  final ErrorSearchState _self;
  final $Res Function(ErrorSearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(ErrorSearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
