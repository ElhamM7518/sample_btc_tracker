part of 'btc_bloc.dart';

@Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions.none,
  copyWith: false,
)
sealed class BtcEvent with _$BtcEvent {
  const factory BtcEvent.loaded() = _Loaded;
}
