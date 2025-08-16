import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_btc_tracker/core/data/endpoints.dart';
import 'package:sample_btc_tracker/core/di/service_locator.dart';
import 'package:sample_btc_tracker/core/di/service_locator_config.config.dart';
import 'package:sample_btc_tracker/core/infrastructure/network_manager/dio_interceptors/dio_interceptors.dart';
import 'package:sample_btc_tracker/core/infrastructure/network_manager/http_client/http_client.dart';

@InjectableInit(
  initializerName: 'initGetIt',
  asExtension: false,
  ignoreUnregisteredTypes: [HttpClient],
)
Future<void> configureDependencies() async {
  GetIt.instance
    ..registerSingleton<Dio>(
      Dio(
        BaseOptions(
          baseUrl: Endpoints.httpsApi.toString(),
          connectTimeout: const Duration(seconds: 15),
          contentType: Headers.jsonContentType,
          receiveDataWhenStatusError: true,
        ),
      ),
    )
    ..registerLazySingleton<HttpClient>(() {
      final dio = ServiceLocator.resolve<Dio>();
      dio.interceptors.addAll([DioLogInterceptor()]);
      return HttpClient(dio);
    });
  initGetIt(GetIt.instance);
}
