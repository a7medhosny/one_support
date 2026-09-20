import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization/cubit/localization_cubit.dart';
import '../networking/dio_factory.dart';
import '../storage/cache/cache_service.dart';
import '../storage/cache/cache_service_impl.dart';
import '../storage/preferences/preferences_service.dart';
import '../storage/preferences/preferences_service_impl.dart';
import '../storage/secure_storage/secure_storage_service.dart';
import '../storage/secure_storage/secure_storage_service_impl.dart';
import '../theme/cubit/theme_cubit.dart';
import '../../features/auth/login/data/datasource/login_api_service.dart';
import '../../features/auth/login/data/datasource/login_remote_data_source.dart';
import '../../features/auth/login/data/repository/login_repository.dart';
import '../../features/auth/login/presentation/cubit/login_cubit.dart';
import '../../features/auth/register/data/datasources/register_api_service.dart';
import '../../features/auth/register/data/datasources/register_remote_data_source.dart';
import '../../features/auth/register/data/repository/register_repository.dart';
import '../../features/auth/register/presentation/cubit/register_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Register your dependencies here
  // Networking
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Secure Storage
  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  getIt.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageServiceImpl(storage: getIt<FlutterSecureStorage>()),
  );

  // Preferences Storage
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<PreferencesService>(
    () => PreferencesServiceImpl(preferences: getIt<SharedPreferences>()),
  );

  // Cache Storage
  final cacheService = CacheServiceImpl();
  await cacheService.init();
  getIt.registerLazySingleton<CacheService>(() => cacheService);

  // Localization & Theme
  getIt.registerLazySingleton<LocalizationCubit>(
    () => LocalizationCubit(preferencesService: getIt<PreferencesService>()),
  );
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(preferencesService: getIt<PreferencesService>()),
  );

  // Auth - Login
  getIt.registerLazySingleton<LoginApiService>(
    () => LoginApiService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSource(getIt<LoginApiService>()),
  );
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(getIt<LoginRemoteDataSource>()),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt<LoginRepository>(),
      getIt<SecureStorageService>(),
      getIt<PreferencesService>(),
    ),
  );

  // Auth - Register
  getIt.registerLazySingleton<RegisterApiService>(
    () => RegisterApiService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSource(getIt<RegisterApiService>()),
  );
  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepository(getIt<RegisterRemoteDataSource>()),
  );
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepository>()),
  );
}
