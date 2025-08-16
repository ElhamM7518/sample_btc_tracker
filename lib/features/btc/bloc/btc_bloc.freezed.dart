// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BtcEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BtcEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BtcEvent()';
}


}





/// @nodoc


class _Loaded implements BtcEvent {
  const _Loaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BtcEvent.loaded()';
}


}




/// @nodoc
mixin _$BtcState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BtcState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BtcState()';
}


}

/// @nodoc
class $BtcStateCopyWith<$Res>  {
$BtcStateCopyWith(BtcState _, $Res Function(BtcState) __);
}



/// @nodoc


class BtcInitial implements BtcState {
  const BtcInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BtcInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BtcState.initial()';
}


}




/// @nodoc


class BtcLoading implements BtcState {
  const BtcLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BtcLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BtcState.loading()';
}


}




/// @nodoc


class BtcLoadFailure implements BtcState {
  const BtcLoadFailure(this.failure);
  

 final  CommonFailure failure;

/// Create a copy of BtcState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BtcLoadFailureCopyWith<BtcLoadFailure> get copyWith => _$BtcLoadFailureCopyWithImpl<BtcLoadFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BtcLoadFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'BtcState.loadFailure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BtcLoadFailureCopyWith<$Res> implements $BtcStateCopyWith<$Res> {
  factory $BtcLoadFailureCopyWith(BtcLoadFailure value, $Res Function(BtcLoadFailure) _then) = _$BtcLoadFailureCopyWithImpl;
@useResult
$Res call({
 CommonFailure failure
});




}
/// @nodoc
class _$BtcLoadFailureCopyWithImpl<$Res>
    implements $BtcLoadFailureCopyWith<$Res> {
  _$BtcLoadFailureCopyWithImpl(this._self, this._then);

  final BtcLoadFailure _self;
  final $Res Function(BtcLoadFailure) _then;

/// Create a copy of BtcState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(BtcLoadFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as CommonFailure,
  ));
}


}

/// @nodoc


class BtcLoadSuccess implements BtcState {
  const BtcLoadSuccess({required this.timeStamp, required final  List<CurrencyPriceEntity> currencyPrices, required final  Map<Currency, List<CurrencyPriceEntity>> currencyPricesHistory, this.isRefreshing = false, this.failedToRefresh}): _currencyPrices = currencyPrices,_currencyPricesHistory = currencyPricesHistory;
  

 final  DateTime timeStamp;
 final  List<CurrencyPriceEntity> _currencyPrices;
 List<CurrencyPriceEntity> get currencyPrices {
  if (_currencyPrices is EqualUnmodifiableListView) return _currencyPrices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currencyPrices);
}

 final  Map<Currency, List<CurrencyPriceEntity>> _currencyPricesHistory;
 Map<Currency, List<CurrencyPriceEntity>> get currencyPricesHistory {
  if (_currencyPricesHistory is EqualUnmodifiableMapView) return _currencyPricesHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_currencyPricesHistory);
}

@JsonKey() final  bool isRefreshing;
 final  CommonFailure? failedToRefresh;

/// Create a copy of BtcState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BtcLoadSuccessCopyWith<BtcLoadSuccess> get copyWith => _$BtcLoadSuccessCopyWithImpl<BtcLoadSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BtcLoadSuccess&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp)&&const DeepCollectionEquality().equals(other._currencyPrices, _currencyPrices)&&const DeepCollectionEquality().equals(other._currencyPricesHistory, _currencyPricesHistory)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.failedToRefresh, failedToRefresh) || other.failedToRefresh == failedToRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,timeStamp,const DeepCollectionEquality().hash(_currencyPrices),const DeepCollectionEquality().hash(_currencyPricesHistory),isRefreshing,failedToRefresh);

@override
String toString() {
  return 'BtcState.loadSuccess(timeStamp: $timeStamp, currencyPrices: $currencyPrices, currencyPricesHistory: $currencyPricesHistory, isRefreshing: $isRefreshing, failedToRefresh: $failedToRefresh)';
}


}

/// @nodoc
abstract mixin class $BtcLoadSuccessCopyWith<$Res> implements $BtcStateCopyWith<$Res> {
  factory $BtcLoadSuccessCopyWith(BtcLoadSuccess value, $Res Function(BtcLoadSuccess) _then) = _$BtcLoadSuccessCopyWithImpl;
@useResult
$Res call({
 DateTime timeStamp, List<CurrencyPriceEntity> currencyPrices, Map<Currency, List<CurrencyPriceEntity>> currencyPricesHistory, bool isRefreshing, CommonFailure? failedToRefresh
});




}
/// @nodoc
class _$BtcLoadSuccessCopyWithImpl<$Res>
    implements $BtcLoadSuccessCopyWith<$Res> {
  _$BtcLoadSuccessCopyWithImpl(this._self, this._then);

  final BtcLoadSuccess _self;
  final $Res Function(BtcLoadSuccess) _then;

/// Create a copy of BtcState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timeStamp = null,Object? currencyPrices = null,Object? currencyPricesHistory = null,Object? isRefreshing = null,Object? failedToRefresh = freezed,}) {
  return _then(BtcLoadSuccess(
timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as DateTime,currencyPrices: null == currencyPrices ? _self._currencyPrices : currencyPrices // ignore: cast_nullable_to_non_nullable
as List<CurrencyPriceEntity>,currencyPricesHistory: null == currencyPricesHistory ? _self._currencyPricesHistory : currencyPricesHistory // ignore: cast_nullable_to_non_nullable
as Map<Currency, List<CurrencyPriceEntity>>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,failedToRefresh: freezed == failedToRefresh ? _self.failedToRefresh : failedToRefresh // ignore: cast_nullable_to_non_nullable
as CommonFailure?,
  ));
}


}

// dart format on
