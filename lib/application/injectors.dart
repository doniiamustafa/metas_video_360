import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_360/application/app_prefs.dart';
import 'package:video_360/data/repository_impl/repository_impl.dart';
import 'package:video_360/domain/usecase/register_use_case.dart';
import 'package:video_360/network/app_service_client/app_service_client.dart';
import 'package:video_360/network/dio_factory.dart';

final instance = GetIt.instance;

Future<void> initApp() async {
  // shared preferences
  final shared = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => shared);
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(sharedPreferences: instance<SharedPreferences>()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // app service client
  Dio dio = await instance<DioFactory>().getDio();

  if (!GetIt.I.isRegistered<AppServiceClient>()) {
    instance.registerLazySingleton<AppServiceClient>(
      () => AppServiceClient(dio),
    );
  }

  if (!GetIt.I.isRegistered<RegisterRepositoryImpl>()) {
    instance.registerLazySingleton<RegisterRepositoryImpl>(
        () => RegisterRepositoryImpl(instance<AppServiceClient>()));
  }

  if (!GetIt.I.isRegistered<RegisterUsecase>()) {
    instance.registerFactory<RegisterUsecase>(
      () => RegisterUsecase(
        repository: instance<RegisterRepositoryImpl>(),
      ),
    );
  }
}
