// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'converter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConverterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConverterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConverterEvent()';
}


}





/// @nodoc


class _CurrencyChanged implements ConverterEvent {
  const _CurrencyChanged({required this.currency, required this.currentPrice});
  

 final  Currency currency;
 final  CurrencyPriceEntity currentPrice;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrencyChanged&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice));
}


@override
int get hashCode => Object.hash(runtimeType,currency,currentPrice);

@override
String toString() {
  return 'ConverterEvent.currencyChanged(currency: $currency, currentPrice: $currentPrice)';
}


}




/// @nodoc


class _CurrencyAmountChanged implements ConverterEvent {
  const _CurrencyAmountChanged({required this.amount, required this.currentPrice});
  

 final  double amount;
 final  CurrencyPriceEntity currentPrice;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrencyAmountChanged&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice));
}


@override
int get hashCode => Object.hash(runtimeType,amount,currentPrice);

@override
String toString() {
  return 'ConverterEvent.currencyAmountChanged(amount: $amount, currentPrice: $currentPrice)';
}


}




/// @nodoc


class _BtcAmountChanged implements ConverterEvent {
  const _BtcAmountChanged({required this.amount, required this.currentPrice});
  

 final  double amount;
 final  CurrencyPriceEntity currentPrice;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BtcAmountChanged&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice));
}


@override
int get hashCode => Object.hash(runtimeType,amount,currentPrice);

@override
String toString() {
  return 'ConverterEvent.btcAmountChanged(amount: $amount, currentPrice: $currentPrice)';
}


}




/// @nodoc


class _ConverterDirectionChanged implements ConverterEvent {
  const _ConverterDirectionChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConverterDirectionChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConverterEvent.converterDirectionChanged()';
}


}




/// @nodoc


class _CurrencyPriceUpdated implements ConverterEvent {
  const _CurrencyPriceUpdated(this.currencyPrice);
  

 final  CurrencyPriceEntity currencyPrice;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrencyPriceUpdated&&(identical(other.currencyPrice, currencyPrice) || other.currencyPrice == currencyPrice));
}


@override
int get hashCode => Object.hash(runtimeType,currencyPrice);

@override
String toString() {
  return 'ConverterEvent.currencyPriceUpdated(currencyPrice: $currencyPrice)';
}


}




/// @nodoc
mixin _$ConverterState {

 Currency get selectedCurrency; double get currencyAmount; double get btcAmount; bool get currencyToBtc;
/// Create a copy of ConverterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConverterStateCopyWith<ConverterState> get copyWith => _$ConverterStateCopyWithImpl<ConverterState>(this as ConverterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConverterState&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency)&&(identical(other.currencyAmount, currencyAmount) || other.currencyAmount == currencyAmount)&&(identical(other.btcAmount, btcAmount) || other.btcAmount == btcAmount)&&(identical(other.currencyToBtc, currencyToBtc) || other.currencyToBtc == currencyToBtc));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCurrency,currencyAmount,btcAmount,currencyToBtc);

@override
String toString() {
  return 'ConverterState(selectedCurrency: $selectedCurrency, currencyAmount: $currencyAmount, btcAmount: $btcAmount, currencyToBtc: $currencyToBtc)';
}


}

/// @nodoc
abstract mixin class $ConverterStateCopyWith<$Res>  {
  factory $ConverterStateCopyWith(ConverterState value, $Res Function(ConverterState) _then) = _$ConverterStateCopyWithImpl;
@useResult
$Res call({
 Currency selectedCurrency, double currencyAmount, double btcAmount, bool currencyToBtc
});




}
/// @nodoc
class _$ConverterStateCopyWithImpl<$Res>
    implements $ConverterStateCopyWith<$Res> {
  _$ConverterStateCopyWithImpl(this._self, this._then);

  final ConverterState _self;
  final $Res Function(ConverterState) _then;

/// Create a copy of ConverterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedCurrency = null,Object? currencyAmount = null,Object? btcAmount = null,Object? currencyToBtc = null,}) {
  return _then(_self.copyWith(
selectedCurrency: null == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as Currency,currencyAmount: null == currencyAmount ? _self.currencyAmount : currencyAmount // ignore: cast_nullable_to_non_nullable
as double,btcAmount: null == btcAmount ? _self.btcAmount : btcAmount // ignore: cast_nullable_to_non_nullable
as double,currencyToBtc: null == currencyToBtc ? _self.currencyToBtc : currencyToBtc // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}



/// @nodoc


class _ConverterState implements ConverterState {
  const _ConverterState({required this.selectedCurrency, required this.currencyAmount, required this.btcAmount, required this.currencyToBtc});
  

@override final  Currency selectedCurrency;
@override final  double currencyAmount;
@override final  double btcAmount;
@override final  bool currencyToBtc;

/// Create a copy of ConverterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConverterStateCopyWith<_ConverterState> get copyWith => __$ConverterStateCopyWithImpl<_ConverterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConverterState&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency)&&(identical(other.currencyAmount, currencyAmount) || other.currencyAmount == currencyAmount)&&(identical(other.btcAmount, btcAmount) || other.btcAmount == btcAmount)&&(identical(other.currencyToBtc, currencyToBtc) || other.currencyToBtc == currencyToBtc));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCurrency,currencyAmount,btcAmount,currencyToBtc);

@override
String toString() {
  return 'ConverterState(selectedCurrency: $selectedCurrency, currencyAmount: $currencyAmount, btcAmount: $btcAmount, currencyToBtc: $currencyToBtc)';
}


}

/// @nodoc
abstract mixin class _$ConverterStateCopyWith<$Res> implements $ConverterStateCopyWith<$Res> {
  factory _$ConverterStateCopyWith(_ConverterState value, $Res Function(_ConverterState) _then) = __$ConverterStateCopyWithImpl;
@override @useResult
$Res call({
 Currency selectedCurrency, double currencyAmount, double btcAmount, bool currencyToBtc
});




}
/// @nodoc
class __$ConverterStateCopyWithImpl<$Res>
    implements _$ConverterStateCopyWith<$Res> {
  __$ConverterStateCopyWithImpl(this._self, this._then);

  final _ConverterState _self;
  final $Res Function(_ConverterState) _then;

/// Create a copy of ConverterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedCurrency = null,Object? currencyAmount = null,Object? btcAmount = null,Object? currencyToBtc = null,}) {
  return _then(_ConverterState(
selectedCurrency: null == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as Currency,currencyAmount: null == currencyAmount ? _self.currencyAmount : currencyAmount // ignore: cast_nullable_to_non_nullable
as double,btcAmount: null == btcAmount ? _self.btcAmount : btcAmount // ignore: cast_nullable_to_non_nullable
as double,currencyToBtc: null == currencyToBtc ? _self.currencyToBtc : currencyToBtc // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
