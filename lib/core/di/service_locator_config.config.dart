// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sample_btc_tracker/core/infrastructure/network_manager/http_client/http_client.dart'
    as _i624;
import 'package:sample_btc_tracker/features/btc/bloc/btc_bloc.dart' as _i503;
import 'package:sample_btc_tracker/features/btc/data/data_source/btc_remote_data_source.dart'
    as _i495;
import 'package:sample_btc_tracker/features/btc/data/repository/btc_repository_impl.dart'
    as _i367;
import 'package:sample_btc_tracker/features/btc/domain/domain.dart' as _i712;
import 'package:sample_btc_tracker/features/converter/bloc/converter_bloc.dart'
    as _i303;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.lazySingleton<_i303.ConverterBloc>(() => _i303.ConverterBloc());
  gh.lazySingleton<_i495.BtcRemoteDataSource>(
    () => _i495.BtcRemoteDataSource(gh<_i624.HttpClient>()),
  );
  gh.lazySingleton<_i712.BtcRepository>(
    () => _i367.BtcRepositoryImpl(gh<_i495.BtcRemoteDataSource>()),
  );
  gh.lazySingleton<_i503.BtcBloc>(
    () => _i503.BtcBloc(gh<_i712.BtcRepository>()),
  );
  return getIt;
}
