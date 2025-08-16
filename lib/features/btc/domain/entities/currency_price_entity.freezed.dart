// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_price_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CurrencyPriceEntity {

 Currency get currency; double get price; DateTime get timeStamp;
/// Create a copy of CurrencyPriceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrencyPriceEntityCopyWith<CurrencyPriceEntity> get copyWith => _$CurrencyPriceEntityCopyWithImpl<CurrencyPriceEntity>(this as CurrencyPriceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrencyPriceEntity&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.price, price) || other.price == price)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}


@override
int get hashCode => Object.hash(runtimeType,currency,price,timeStamp);

@override
String toString() {
  return 'CurrencyPriceEntity(currency: $currency, price: $price, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class $CurrencyPriceEntityCopyWith<$Res>  {
  factory $CurrencyPriceEntityCopyWith(CurrencyPriceEntity value, $Res Function(CurrencyPriceEntity) _then) = _$CurrencyPriceEntityCopyWithImpl;
@useResult
$Res call({
 Currency currency, double price, DateTime timeStamp
});




}
/// @nodoc
class _$CurrencyPriceEntityCopyWithImpl<$Res>
    implements $CurrencyPriceEntityCopyWith<$Res> {
  _$CurrencyPriceEntityCopyWithImpl(this._self, this._then);

  final CurrencyPriceEntity _self;
  final $Res Function(CurrencyPriceEntity) _then;

/// Create a copy of CurrencyPriceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,Object? price = null,Object? timeStamp = null,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrencyPriceEntity].
extension CurrencyPriceEntityPatterns on CurrencyPriceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrencyPriceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrencyPriceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrencyPriceEntity value)  $default,){
final _that = this;
switch (_that) {
case _CurrencyPriceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrencyPriceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CurrencyPriceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Currency currency,  double price,  DateTime timeStamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrencyPriceEntity() when $default != null:
return $default(_that.currency,_that.price,_that.timeStamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Currency currency,  double price,  DateTime timeStamp)  $default,) {final _that = this;
switch (_that) {
case _CurrencyPriceEntity():
return $default(_that.currency,_that.price,_that.timeStamp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Currency currency,  double price,  DateTime timeStamp)?  $default,) {final _that = this;
switch (_that) {
case _CurrencyPriceEntity() when $default != null:
return $default(_that.currency,_that.price,_that.timeStamp);case _:
  return null;

}
}

}

/// @nodoc


class _CurrencyPriceEntity implements CurrencyPriceEntity {
  const _CurrencyPriceEntity({required this.currency, required this.price, required this.timeStamp});
  

@override final  Currency currency;
@override final  double price;
@override final  DateTime timeStamp;

/// Create a copy of CurrencyPriceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrencyPriceEntityCopyWith<_CurrencyPriceEntity> get copyWith => __$CurrencyPriceEntityCopyWithImpl<_CurrencyPriceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrencyPriceEntity&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.price, price) || other.price == price)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}


@override
int get hashCode => Object.hash(runtimeType,currency,price,timeStamp);

@override
String toString() {
  return 'CurrencyPriceEntity(currency: $currency, price: $price, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class _$CurrencyPriceEntityCopyWith<$Res> implements $CurrencyPriceEntityCopyWith<$Res> {
  factory _$CurrencyPriceEntityCopyWith(_CurrencyPriceEntity value, $Res Function(_CurrencyPriceEntity) _then) = __$CurrencyPriceEntityCopyWithImpl;
@override @useResult
$Res call({
 Currency currency, double price, DateTime timeStamp
});




}
/// @nodoc
class __$CurrencyPriceEntityCopyWithImpl<$Res>
    implements _$CurrencyPriceEntityCopyWith<$Res> {
  __$CurrencyPriceEntityCopyWithImpl(this._self, this._then);

  final _CurrencyPriceEntity _self;
  final $Res Function(_CurrencyPriceEntity) _then;

/// Create a copy of CurrencyPriceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,Object? price = null,Object? timeStamp = null,}) {
  return _then(_CurrencyPriceEntity(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
