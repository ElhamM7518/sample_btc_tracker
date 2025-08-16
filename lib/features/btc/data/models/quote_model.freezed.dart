// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuoteModel {

 double get price;@JsonKey(name: 'volume_24h') double get volume24h;@JsonKey(name: 'market_cap') double get marketCap;@JsonKey(name: 'percentage_change_1h') double? get percentageChange1h;@JsonKey(name: 'percentage_change_24h') double? get percentageChange24h;@JsonKey(name: 'percentage_change_7d') double? get percentageChange7d;@JsonKey(name: 'percent_change_1h') double? get percentChange1h;@JsonKey(name: 'percent_change_24h') double? get percentChange24h;@JsonKey(name: 'percent_change_7d') double? get percentChange7d;
/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteModelCopyWith<QuoteModel> get copyWith => _$QuoteModelCopyWithImpl<QuoteModel>(this as QuoteModel, _$identity);

  /// Serializes this QuoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteModel&&(identical(other.price, price) || other.price == price)&&(identical(other.volume24h, volume24h) || other.volume24h == volume24h)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.percentageChange1h, percentageChange1h) || other.percentageChange1h == percentageChange1h)&&(identical(other.percentageChange24h, percentageChange24h) || other.percentageChange24h == percentageChange24h)&&(identical(other.percentageChange7d, percentageChange7d) || other.percentageChange7d == percentageChange7d)&&(identical(other.percentChange1h, percentChange1h) || other.percentChange1h == percentChange1h)&&(identical(other.percentChange24h, percentChange24h) || other.percentChange24h == percentChange24h)&&(identical(other.percentChange7d, percentChange7d) || other.percentChange7d == percentChange7d));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,volume24h,marketCap,percentageChange1h,percentageChange24h,percentageChange7d,percentChange1h,percentChange24h,percentChange7d);

@override
String toString() {
  return 'QuoteModel(price: $price, volume24h: $volume24h, marketCap: $marketCap, percentageChange1h: $percentageChange1h, percentageChange24h: $percentageChange24h, percentageChange7d: $percentageChange7d, percentChange1h: $percentChange1h, percentChange24h: $percentChange24h, percentChange7d: $percentChange7d)';
}


}

/// @nodoc
abstract mixin class $QuoteModelCopyWith<$Res>  {
  factory $QuoteModelCopyWith(QuoteModel value, $Res Function(QuoteModel) _then) = _$QuoteModelCopyWithImpl;
@useResult
$Res call({
 double price,@JsonKey(name: 'volume_24h') double volume24h,@JsonKey(name: 'market_cap') double marketCap,@JsonKey(name: 'percentage_change_1h') double? percentageChange1h,@JsonKey(name: 'percentage_change_24h') double? percentageChange24h,@JsonKey(name: 'percentage_change_7d') double? percentageChange7d,@JsonKey(name: 'percent_change_1h') double? percentChange1h,@JsonKey(name: 'percent_change_24h') double? percentChange24h,@JsonKey(name: 'percent_change_7d') double? percentChange7d
});




}
/// @nodoc
class _$QuoteModelCopyWithImpl<$Res>
    implements $QuoteModelCopyWith<$Res> {
  _$QuoteModelCopyWithImpl(this._self, this._then);

  final QuoteModel _self;
  final $Res Function(QuoteModel) _then;

/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? volume24h = null,Object? marketCap = null,Object? percentageChange1h = freezed,Object? percentageChange24h = freezed,Object? percentageChange7d = freezed,Object? percentChange1h = freezed,Object? percentChange24h = freezed,Object? percentChange7d = freezed,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,volume24h: null == volume24h ? _self.volume24h : volume24h // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double,percentageChange1h: freezed == percentageChange1h ? _self.percentageChange1h : percentageChange1h // ignore: cast_nullable_to_non_nullable
as double?,percentageChange24h: freezed == percentageChange24h ? _self.percentageChange24h : percentageChange24h // ignore: cast_nullable_to_non_nullable
as double?,percentageChange7d: freezed == percentageChange7d ? _self.percentageChange7d : percentageChange7d // ignore: cast_nullable_to_non_nullable
as double?,percentChange1h: freezed == percentChange1h ? _self.percentChange1h : percentChange1h // ignore: cast_nullable_to_non_nullable
as double?,percentChange24h: freezed == percentChange24h ? _self.percentChange24h : percentChange24h // ignore: cast_nullable_to_non_nullable
as double?,percentChange7d: freezed == percentChange7d ? _self.percentChange7d : percentChange7d // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteModel].
extension QuoteModelPatterns on QuoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteModel value)  $default,){
final _that = this;
switch (_that) {
case _QuoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double price, @JsonKey(name: 'volume_24h')  double volume24h, @JsonKey(name: 'market_cap')  double marketCap, @JsonKey(name: 'percentage_change_1h')  double? percentageChange1h, @JsonKey(name: 'percentage_change_24h')  double? percentageChange24h, @JsonKey(name: 'percentage_change_7d')  double? percentageChange7d, @JsonKey(name: 'percent_change_1h')  double? percentChange1h, @JsonKey(name: 'percent_change_24h')  double? percentChange24h, @JsonKey(name: 'percent_change_7d')  double? percentChange7d)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
return $default(_that.price,_that.volume24h,_that.marketCap,_that.percentageChange1h,_that.percentageChange24h,_that.percentageChange7d,_that.percentChange1h,_that.percentChange24h,_that.percentChange7d);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double price, @JsonKey(name: 'volume_24h')  double volume24h, @JsonKey(name: 'market_cap')  double marketCap, @JsonKey(name: 'percentage_change_1h')  double? percentageChange1h, @JsonKey(name: 'percentage_change_24h')  double? percentageChange24h, @JsonKey(name: 'percentage_change_7d')  double? percentageChange7d, @JsonKey(name: 'percent_change_1h')  double? percentChange1h, @JsonKey(name: 'percent_change_24h')  double? percentChange24h, @JsonKey(name: 'percent_change_7d')  double? percentChange7d)  $default,) {final _that = this;
switch (_that) {
case _QuoteModel():
return $default(_that.price,_that.volume24h,_that.marketCap,_that.percentageChange1h,_that.percentageChange24h,_that.percentageChange7d,_that.percentChange1h,_that.percentChange24h,_that.percentChange7d);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double price, @JsonKey(name: 'volume_24h')  double volume24h, @JsonKey(name: 'market_cap')  double marketCap, @JsonKey(name: 'percentage_change_1h')  double? percentageChange1h, @JsonKey(name: 'percentage_change_24h')  double? percentageChange24h, @JsonKey(name: 'percentage_change_7d')  double? percentageChange7d, @JsonKey(name: 'percent_change_1h')  double? percentChange1h, @JsonKey(name: 'percent_change_24h')  double? percentChange24h, @JsonKey(name: 'percent_change_7d')  double? percentChange7d)?  $default,) {final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
return $default(_that.price,_that.volume24h,_that.marketCap,_that.percentageChange1h,_that.percentageChange24h,_that.percentageChange7d,_that.percentChange1h,_that.percentChange24h,_that.percentChange7d);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteModel implements QuoteModel {
  const _QuoteModel({required this.price, @JsonKey(name: 'volume_24h') required this.volume24h, @JsonKey(name: 'market_cap') required this.marketCap, @JsonKey(name: 'percentage_change_1h') this.percentageChange1h, @JsonKey(name: 'percentage_change_24h') this.percentageChange24h, @JsonKey(name: 'percentage_change_7d') this.percentageChange7d, @JsonKey(name: 'percent_change_1h') this.percentChange1h, @JsonKey(name: 'percent_change_24h') this.percentChange24h, @JsonKey(name: 'percent_change_7d') this.percentChange7d});
  factory _QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

@override final  double price;
@override@JsonKey(name: 'volume_24h') final  double volume24h;
@override@JsonKey(name: 'market_cap') final  double marketCap;
@override@JsonKey(name: 'percentage_change_1h') final  double? percentageChange1h;
@override@JsonKey(name: 'percentage_change_24h') final  double? percentageChange24h;
@override@JsonKey(name: 'percentage_change_7d') final  double? percentageChange7d;
@override@JsonKey(name: 'percent_change_1h') final  double? percentChange1h;
@override@JsonKey(name: 'percent_change_24h') final  double? percentChange24h;
@override@JsonKey(name: 'percent_change_7d') final  double? percentChange7d;

/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteModelCopyWith<_QuoteModel> get copyWith => __$QuoteModelCopyWithImpl<_QuoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteModel&&(identical(other.price, price) || other.price == price)&&(identical(other.volume24h, volume24h) || other.volume24h == volume24h)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.percentageChange1h, percentageChange1h) || other.percentageChange1h == percentageChange1h)&&(identical(other.percentageChange24h, percentageChange24h) || other.percentageChange24h == percentageChange24h)&&(identical(other.percentageChange7d, percentageChange7d) || other.percentageChange7d == percentageChange7d)&&(identical(other.percentChange1h, percentChange1h) || other.percentChange1h == percentChange1h)&&(identical(other.percentChange24h, percentChange24h) || other.percentChange24h == percentChange24h)&&(identical(other.percentChange7d, percentChange7d) || other.percentChange7d == percentChange7d));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,volume24h,marketCap,percentageChange1h,percentageChange24h,percentageChange7d,percentChange1h,percentChange24h,percentChange7d);

@override
String toString() {
  return 'QuoteModel(price: $price, volume24h: $volume24h, marketCap: $marketCap, percentageChange1h: $percentageChange1h, percentageChange24h: $percentageChange24h, percentageChange7d: $percentageChange7d, percentChange1h: $percentChange1h, percentChange24h: $percentChange24h, percentChange7d: $percentChange7d)';
}


}

/// @nodoc
abstract mixin class _$QuoteModelCopyWith<$Res> implements $QuoteModelCopyWith<$Res> {
  factory _$QuoteModelCopyWith(_QuoteModel value, $Res Function(_QuoteModel) _then) = __$QuoteModelCopyWithImpl;
@override @useResult
$Res call({
 double price,@JsonKey(name: 'volume_24h') double volume24h,@JsonKey(name: 'market_cap') double marketCap,@JsonKey(name: 'percentage_change_1h') double? percentageChange1h,@JsonKey(name: 'percentage_change_24h') double? percentageChange24h,@JsonKey(name: 'percentage_change_7d') double? percentageChange7d,@JsonKey(name: 'percent_change_1h') double? percentChange1h,@JsonKey(name: 'percent_change_24h') double? percentChange24h,@JsonKey(name: 'percent_change_7d') double? percentChange7d
});




}
/// @nodoc
class __$QuoteModelCopyWithImpl<$Res>
    implements _$QuoteModelCopyWith<$Res> {
  __$QuoteModelCopyWithImpl(this._self, this._then);

  final _QuoteModel _self;
  final $Res Function(_QuoteModel) _then;

/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? volume24h = null,Object? marketCap = null,Object? percentageChange1h = freezed,Object? percentageChange24h = freezed,Object? percentageChange7d = freezed,Object? percentChange1h = freezed,Object? percentChange24h = freezed,Object? percentChange7d = freezed,}) {
  return _then(_QuoteModel(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,volume24h: null == volume24h ? _self.volume24h : volume24h // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double,percentageChange1h: freezed == percentageChange1h ? _self.percentageChange1h : percentageChange1h // ignore: cast_nullable_to_non_nullable
as double?,percentageChange24h: freezed == percentageChange24h ? _self.percentageChange24h : percentageChange24h // ignore: cast_nullable_to_non_nullable
as double?,percentageChange7d: freezed == percentageChange7d ? _self.percentageChange7d : percentageChange7d // ignore: cast_nullable_to_non_nullable
as double?,percentChange1h: freezed == percentChange1h ? _self.percentChange1h : percentChange1h // ignore: cast_nullable_to_non_nullable
as double?,percentChange24h: freezed == percentChange24h ? _self.percentChange24h : percentChange24h // ignore: cast_nullable_to_non_nullable
as double?,percentChange7d: freezed == percentChange7d ? _self.percentChange7d : percentChange7d // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
