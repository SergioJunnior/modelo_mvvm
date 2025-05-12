import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:modelo_mvvm/core/dio/dio_client.dart';
import 'package:modelo_mvvm/core/dio/dio_http_client.dart';

final getIt = GetIt.instance;

void dioDepencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioHttpClient(Dio()));
}
