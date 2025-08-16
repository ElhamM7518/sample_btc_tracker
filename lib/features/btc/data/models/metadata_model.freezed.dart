// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetadataModel {

 int get timestamp;@JsonKey(name: 'num_cryptocurrencies') int get numCryptocurrencies; String? get error;
/// Create a copy of MetadataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataModelCopyWith<MetadataModel> get copyWith => _$MetadataModelCopyWithImpl<MetadataModel>(this as MetadataModel, _$identity);

  /// Serializes this MetadataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataModel&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.numCryptocurrencies, numCryptocurrencies) || other.numCryptocurrencies == numCryptocurrencies)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,numCryptocurrencies,error);

@override
String toString() {
  return 'MetadataModel(timestamp: $timestamp, numCryptocurrencies: $numCryptocurrencies, error: $error)';
}


}

/// @nodoc
abstract mixin class $MetadataModelCopyWith<$Res>  {
  factory $MetadataModelCopyWith(MetadataModel value, $Res Function(MetadataModel) _then) = _$MetadataModelCopyWithImpl;
@useResult
$Res call({
 int timestamp,@JsonKey(name: 'num_cryptocurrencies') int numCryptocurrencies, String? error
});




}
/// @nodoc
class _$MetadataModelCopyWithImpl<$Res>
    implements $MetadataModelCopyWith<$Res> {
  _$MetadataModelCopyWithImpl(this._self, this._then);

  final MetadataModel _self;
  final $Res Function(MetadataModel) _then;

/// Create a copy of MetadataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? numCryptocurrencies = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,numCryptocurrencies: null == numCryptocurrencies ? _self.numCryptocurrencies : numCryptocurrencies // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MetadataModel].
extension MetadataModelPatterns on MetadataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetadataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetadataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetadataModel value)  $default,){
final _that = this;
switch (_that) {
case _MetadataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetadataModel value)?  $default,){
final _that = this;
switch (_that) {
case _MetadataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int timestamp, @JsonKey(name: 'num_cryptocurrencies')  int numCryptocurrencies,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetadataModel() when $default != null:
return $default(_that.timestamp,_that.numCryptocurrencies,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int timestamp, @JsonKey(name: 'num_cryptocurrencies')  int numCryptocurrencies,  String? error)  $default,) {final _that = this;
switch (_that) {
case _MetadataModel():
return $default(_that.timestamp,_that.numCryptocurrencies,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int timestamp, @JsonKey(name: 'num_cryptocurrencies')  int numCryptocurrencies,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _MetadataModel() when $default != null:
return $default(_that.timestamp,_that.numCryptocurrencies,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetadataModel implements MetadataModel {
  const _MetadataModel({required this.timestamp, @JsonKey(name: 'num_cryptocurrencies') required this.numCryptocurrencies, this.error});
  factory _MetadataModel.fromJson(Map<String, dynamic> json) => _$MetadataModelFromJson(json);

@override final  int timestamp;
@override@JsonKey(name: 'num_cryptocurrencies') final  int numCryptocurrencies;
@override final  String? error;

/// Create a copy of MetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataModelCopyWith<_MetadataModel> get copyWith => __$MetadataModelCopyWithImpl<_MetadataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetadataModel&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.numCryptocurrencies, numCryptocurrencies) || other.numCryptocurrencies == numCryptocurrencies)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,numCryptocurrencies,error);

@override
String toString() {
  return 'MetadataModel(timestamp: $timestamp, numCryptocurrencies: $numCryptocurrencies, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MetadataModelCopyWith<$Res> implements $MetadataModelCopyWith<$Res> {
  factory _$MetadataModelCopyWith(_MetadataModel value, $Res Function(_MetadataModel) _then) = __$MetadataModelCopyWithImpl;
@override @useResult
$Res call({
 int timestamp,@JsonKey(name: 'num_cryptocurrencies') int numCryptocurrencies, String? error
});




}
/// @nodoc
class __$MetadataModelCopyWithImpl<$Res>
    implements _$MetadataModelCopyWith<$Res> {
  __$MetadataModelCopyWithImpl(this._self, this._then);

  final _MetadataModel _self;
  final $Res Function(_MetadataModel) _then;

/// Create a copy of MetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? numCryptocurrencies = null,Object? error = freezed,}) {
  return _then(_MetadataModel(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,numCryptocurrencies: null == numCryptocurrencies ? _self.numCryptocurrencies : numCryptocurrencies // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
