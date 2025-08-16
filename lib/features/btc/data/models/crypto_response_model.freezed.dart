// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CryptoResponseModel {

 Map<String, CryptoDataModel> get data; MetadataModel get metadata;
/// Create a copy of CryptoResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CryptoResponseModelCopyWith<CryptoResponseModel> get copyWith => _$CryptoResponseModelCopyWithImpl<CryptoResponseModel>(this as CryptoResponseModel, _$identity);

  /// Serializes this CryptoResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CryptoResponseModel&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),metadata);

@override
String toString() {
  return 'CryptoResponseModel(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $CryptoResponseModelCopyWith<$Res>  {
  factory $CryptoResponseModelCopyWith(CryptoResponseModel value, $Res Function(CryptoResponseModel) _then) = _$CryptoResponseModelCopyWithImpl;
@useResult
$Res call({
 Map<String, CryptoDataModel> data, MetadataModel metadata
});


$MetadataModelCopyWith<$Res> get metadata;

}
/// @nodoc
class _$CryptoResponseModelCopyWithImpl<$Res>
    implements $CryptoResponseModelCopyWith<$Res> {
  _$CryptoResponseModelCopyWithImpl(this._self, this._then);

  final CryptoResponseModel _self;
  final $Res Function(CryptoResponseModel) _then;

/// Create a copy of CryptoResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, CryptoDataModel>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataModel,
  ));
}
/// Create a copy of CryptoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataModelCopyWith<$Res> get metadata {
  
  return $MetadataModelCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [CryptoResponseModel].
extension CryptoResponseModelPatterns on CryptoResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CryptoResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CryptoResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CryptoResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CryptoResponseModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CryptoResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CryptoResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, CryptoDataModel> data,  MetadataModel metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CryptoResponseModel() when $default != null:
return $default(_that.data,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, CryptoDataModel> data,  MetadataModel metadata)  $default,) {final _that = this;
switch (_that) {
case _CryptoResponseModel():
return $default(_that.data,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, CryptoDataModel> data,  MetadataModel metadata)?  $default,) {final _that = this;
switch (_that) {
case _CryptoResponseModel() when $default != null:
return $default(_that.data,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CryptoResponseModel implements CryptoResponseModel {
  const _CryptoResponseModel({required final  Map<String, CryptoDataModel> data, required this.metadata}): _data = data;
  factory _CryptoResponseModel.fromJson(Map<String, dynamic> json) => _$CryptoResponseModelFromJson(json);

 final  Map<String, CryptoDataModel> _data;
@override Map<String, CryptoDataModel> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

@override final  MetadataModel metadata;

/// Create a copy of CryptoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CryptoResponseModelCopyWith<_CryptoResponseModel> get copyWith => __$CryptoResponseModelCopyWithImpl<_CryptoResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CryptoResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CryptoResponseModel&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),metadata);

@override
String toString() {
  return 'CryptoResponseModel(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$CryptoResponseModelCopyWith<$Res> implements $CryptoResponseModelCopyWith<$Res> {
  factory _$CryptoResponseModelCopyWith(_CryptoResponseModel value, $Res Function(_CryptoResponseModel) _then) = __$CryptoResponseModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, CryptoDataModel> data, MetadataModel metadata
});


@override $MetadataModelCopyWith<$Res> get metadata;

}
/// @nodoc
class __$CryptoResponseModelCopyWithImpl<$Res>
    implements _$CryptoResponseModelCopyWith<$Res> {
  __$CryptoResponseModelCopyWithImpl(this._self, this._then);

  final _CryptoResponseModel _self;
  final $Res Function(_CryptoResponseModel) _then;

/// Create a copy of CryptoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? metadata = null,}) {
  return _then(_CryptoResponseModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, CryptoDataModel>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataModel,
  ));
}

/// Create a copy of CryptoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataModelCopyWith<$Res> get metadata {
  
  return $MetadataModelCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
