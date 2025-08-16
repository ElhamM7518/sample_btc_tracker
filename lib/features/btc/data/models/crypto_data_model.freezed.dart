// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CryptoDataModel {

 int get id; String get name; String get symbol;@JsonKey(name: 'website_slug') String get websiteSlug; int get rank;@JsonKey(name: 'circulating_supply') num get circulatingSupply;@JsonKey(name: 'total_supply') num get totalSupply;@JsonKey(name: 'max_supply') num? get maxSupply; Map<String, QuoteModel> get quotes;@JsonKey(name: 'last_updated') int get lastUpdated;
/// Create a copy of CryptoDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CryptoDataModelCopyWith<CryptoDataModel> get copyWith => _$CryptoDataModelCopyWithImpl<CryptoDataModel>(this as CryptoDataModel, _$identity);

  /// Serializes this CryptoDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CryptoDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.websiteSlug, websiteSlug) || other.websiteSlug == websiteSlug)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.circulatingSupply, circulatingSupply) || other.circulatingSupply == circulatingSupply)&&(identical(other.totalSupply, totalSupply) || other.totalSupply == totalSupply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&const DeepCollectionEquality().equals(other.quotes, quotes)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,symbol,websiteSlug,rank,circulatingSupply,totalSupply,maxSupply,const DeepCollectionEquality().hash(quotes),lastUpdated);

@override
String toString() {
  return 'CryptoDataModel(id: $id, name: $name, symbol: $symbol, websiteSlug: $websiteSlug, rank: $rank, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, quotes: $quotes, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $CryptoDataModelCopyWith<$Res>  {
  factory $CryptoDataModelCopyWith(CryptoDataModel value, $Res Function(CryptoDataModel) _then) = _$CryptoDataModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String symbol,@JsonKey(name: 'website_slug') String websiteSlug, int rank,@JsonKey(name: 'circulating_supply') num circulatingSupply,@JsonKey(name: 'total_supply') num totalSupply,@JsonKey(name: 'max_supply') num? maxSupply, Map<String, QuoteModel> quotes,@JsonKey(name: 'last_updated') int lastUpdated
});




}
/// @nodoc
class _$CryptoDataModelCopyWithImpl<$Res>
    implements $CryptoDataModelCopyWith<$Res> {
  _$CryptoDataModelCopyWithImpl(this._self, this._then);

  final CryptoDataModel _self;
  final $Res Function(CryptoDataModel) _then;

/// Create a copy of CryptoDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? symbol = null,Object? websiteSlug = null,Object? rank = null,Object? circulatingSupply = null,Object? totalSupply = null,Object? maxSupply = freezed,Object? quotes = null,Object? lastUpdated = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,websiteSlug: null == websiteSlug ? _self.websiteSlug : websiteSlug // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,circulatingSupply: null == circulatingSupply ? _self.circulatingSupply : circulatingSupply // ignore: cast_nullable_to_non_nullable
as num,totalSupply: null == totalSupply ? _self.totalSupply : totalSupply // ignore: cast_nullable_to_non_nullable
as num,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as num?,quotes: null == quotes ? _self.quotes : quotes // ignore: cast_nullable_to_non_nullable
as Map<String, QuoteModel>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CryptoDataModel].
extension CryptoDataModelPatterns on CryptoDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CryptoDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CryptoDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CryptoDataModel value)  $default,){
final _that = this;
switch (_that) {
case _CryptoDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CryptoDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _CryptoDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String symbol, @JsonKey(name: 'website_slug')  String websiteSlug,  int rank, @JsonKey(name: 'circulating_supply')  num circulatingSupply, @JsonKey(name: 'total_supply')  num totalSupply, @JsonKey(name: 'max_supply')  num? maxSupply,  Map<String, QuoteModel> quotes, @JsonKey(name: 'last_updated')  int lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CryptoDataModel() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.websiteSlug,_that.rank,_that.circulatingSupply,_that.totalSupply,_that.maxSupply,_that.quotes,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String symbol, @JsonKey(name: 'website_slug')  String websiteSlug,  int rank, @JsonKey(name: 'circulating_supply')  num circulatingSupply, @JsonKey(name: 'total_supply')  num totalSupply, @JsonKey(name: 'max_supply')  num? maxSupply,  Map<String, QuoteModel> quotes, @JsonKey(name: 'last_updated')  int lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _CryptoDataModel():
return $default(_that.id,_that.name,_that.symbol,_that.websiteSlug,_that.rank,_that.circulatingSupply,_that.totalSupply,_that.maxSupply,_that.quotes,_that.lastUpdated);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String symbol, @JsonKey(name: 'website_slug')  String websiteSlug,  int rank, @JsonKey(name: 'circulating_supply')  num circulatingSupply, @JsonKey(name: 'total_supply')  num totalSupply, @JsonKey(name: 'max_supply')  num? maxSupply,  Map<String, QuoteModel> quotes, @JsonKey(name: 'last_updated')  int lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _CryptoDataModel() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.websiteSlug,_that.rank,_that.circulatingSupply,_that.totalSupply,_that.maxSupply,_that.quotes,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CryptoDataModel implements CryptoDataModel {
  const _CryptoDataModel({required this.id, required this.name, required this.symbol, @JsonKey(name: 'website_slug') required this.websiteSlug, required this.rank, @JsonKey(name: 'circulating_supply') required this.circulatingSupply, @JsonKey(name: 'total_supply') required this.totalSupply, @JsonKey(name: 'max_supply') required this.maxSupply, required final  Map<String, QuoteModel> quotes, @JsonKey(name: 'last_updated') required this.lastUpdated}): _quotes = quotes;
  factory _CryptoDataModel.fromJson(Map<String, dynamic> json) => _$CryptoDataModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String symbol;
@override@JsonKey(name: 'website_slug') final  String websiteSlug;
@override final  int rank;
@override@JsonKey(name: 'circulating_supply') final  num circulatingSupply;
@override@JsonKey(name: 'total_supply') final  num totalSupply;
@override@JsonKey(name: 'max_supply') final  num? maxSupply;
 final  Map<String, QuoteModel> _quotes;
@override Map<String, QuoteModel> get quotes {
  if (_quotes is EqualUnmodifiableMapView) return _quotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_quotes);
}

@override@JsonKey(name: 'last_updated') final  int lastUpdated;

/// Create a copy of CryptoDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CryptoDataModelCopyWith<_CryptoDataModel> get copyWith => __$CryptoDataModelCopyWithImpl<_CryptoDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CryptoDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CryptoDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.websiteSlug, websiteSlug) || other.websiteSlug == websiteSlug)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.circulatingSupply, circulatingSupply) || other.circulatingSupply == circulatingSupply)&&(identical(other.totalSupply, totalSupply) || other.totalSupply == totalSupply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&const DeepCollectionEquality().equals(other._quotes, _quotes)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,symbol,websiteSlug,rank,circulatingSupply,totalSupply,maxSupply,const DeepCollectionEquality().hash(_quotes),lastUpdated);

@override
String toString() {
  return 'CryptoDataModel(id: $id, name: $name, symbol: $symbol, websiteSlug: $websiteSlug, rank: $rank, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, quotes: $quotes, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$CryptoDataModelCopyWith<$Res> implements $CryptoDataModelCopyWith<$Res> {
  factory _$CryptoDataModelCopyWith(_CryptoDataModel value, $Res Function(_CryptoDataModel) _then) = __$CryptoDataModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String symbol,@JsonKey(name: 'website_slug') String websiteSlug, int rank,@JsonKey(name: 'circulating_supply') num circulatingSupply,@JsonKey(name: 'total_supply') num totalSupply,@JsonKey(name: 'max_supply') num? maxSupply, Map<String, QuoteModel> quotes,@JsonKey(name: 'last_updated') int lastUpdated
});




}
/// @nodoc
class __$CryptoDataModelCopyWithImpl<$Res>
    implements _$CryptoDataModelCopyWith<$Res> {
  __$CryptoDataModelCopyWithImpl(this._self, this._then);

  final _CryptoDataModel _self;
  final $Res Function(_CryptoDataModel) _then;

/// Create a copy of CryptoDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? symbol = null,Object? websiteSlug = null,Object? rank = null,Object? circulatingSupply = null,Object? totalSupply = null,Object? maxSupply = freezed,Object? quotes = null,Object? lastUpdated = null,}) {
  return _then(_CryptoDataModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,websiteSlug: null == websiteSlug ? _self.websiteSlug : websiteSlug // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,circulatingSupply: null == circulatingSupply ? _self.circulatingSupply : circulatingSupply // ignore: cast_nullable_to_non_nullable
as num,totalSupply: null == totalSupply ? _self.totalSupply : totalSupply // ignore: cast_nullable_to_non_nullable
as num,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as num?,quotes: null == quotes ? _self._quotes : quotes // ignore: cast_nullable_to_non_nullable
as Map<String, QuoteModel>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
