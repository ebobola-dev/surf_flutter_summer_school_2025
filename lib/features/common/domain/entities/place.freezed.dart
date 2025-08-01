// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaceEntity {

 int get id; String get name; String get description; List<String> get imageUrls; double get lat; double get lon; PlaceTypeEntity get placeType;
/// Create a copy of PlaceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceEntityCopyWith<PlaceEntity> get copyWith => _$PlaceEntityCopyWithImpl<PlaceEntity>(this as PlaceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.placeType, placeType) || other.placeType == placeType));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(imageUrls),lat,lon,placeType);

@override
String toString() {
  return 'PlaceEntity(id: $id, name: $name, description: $description, imageUrls: $imageUrls, lat: $lat, lon: $lon, placeType: $placeType)';
}


}

/// @nodoc
abstract mixin class $PlaceEntityCopyWith<$Res>  {
  factory $PlaceEntityCopyWith(PlaceEntity value, $Res Function(PlaceEntity) _then) = _$PlaceEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, List<String> imageUrls, double lat, double lon, PlaceTypeEntity placeType
});




}
/// @nodoc
class _$PlaceEntityCopyWithImpl<$Res>
    implements $PlaceEntityCopyWith<$Res> {
  _$PlaceEntityCopyWithImpl(this._self, this._then);

  final PlaceEntity _self;
  final $Res Function(PlaceEntity) _then;

/// Create a copy of PlaceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrls = null,Object? lat = null,Object? lon = null,Object? placeType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,placeType: null == placeType ? _self.placeType : placeType // ignore: cast_nullable_to_non_nullable
as PlaceTypeEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceEntity].
extension PlaceEntityPatterns on PlaceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceEntity value)  $default,){
final _that = this;
switch (_that) {
case _PlaceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  List<String> imageUrls,  double lat,  double lon,  PlaceTypeEntity placeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrls,_that.lat,_that.lon,_that.placeType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  List<String> imageUrls,  double lat,  double lon,  PlaceTypeEntity placeType)  $default,) {final _that = this;
switch (_that) {
case _PlaceEntity():
return $default(_that.id,_that.name,_that.description,_that.imageUrls,_that.lat,_that.lon,_that.placeType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  List<String> imageUrls,  double lat,  double lon,  PlaceTypeEntity placeType)?  $default,) {final _that = this;
switch (_that) {
case _PlaceEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrls,_that.lat,_that.lon,_that.placeType);case _:
  return null;

}
}

}

/// @nodoc


class _PlaceEntity extends PlaceEntity {
  const _PlaceEntity({required this.id, required this.name, required this.description, required final  List<String> imageUrls, required this.lat, required this.lon, required this.placeType}): _imageUrls = imageUrls,super._();
  

@override final  int id;
@override final  String name;
@override final  String description;
 final  List<String> _imageUrls;
@override List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

@override final  double lat;
@override final  double lon;
@override final  PlaceTypeEntity placeType;

/// Create a copy of PlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceEntityCopyWith<_PlaceEntity> get copyWith => __$PlaceEntityCopyWithImpl<_PlaceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.placeType, placeType) || other.placeType == placeType));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_imageUrls),lat,lon,placeType);

@override
String toString() {
  return 'PlaceEntity(id: $id, name: $name, description: $description, imageUrls: $imageUrls, lat: $lat, lon: $lon, placeType: $placeType)';
}


}

/// @nodoc
abstract mixin class _$PlaceEntityCopyWith<$Res> implements $PlaceEntityCopyWith<$Res> {
  factory _$PlaceEntityCopyWith(_PlaceEntity value, $Res Function(_PlaceEntity) _then) = __$PlaceEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, List<String> imageUrls, double lat, double lon, PlaceTypeEntity placeType
});




}
/// @nodoc
class __$PlaceEntityCopyWithImpl<$Res>
    implements _$PlaceEntityCopyWith<$Res> {
  __$PlaceEntityCopyWithImpl(this._self, this._then);

  final _PlaceEntity _self;
  final $Res Function(_PlaceEntity) _then;

/// Create a copy of PlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrls = null,Object? lat = null,Object? lon = null,Object? placeType = null,}) {
  return _then(_PlaceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,placeType: null == placeType ? _self.placeType : placeType // ignore: cast_nullable_to_non_nullable
as PlaceTypeEntity,
  ));
}


}

// dart format on
