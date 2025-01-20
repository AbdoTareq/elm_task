import 'package:dio/dio.dart';
import 'package:elm_task/core/network/network_info.dart';
import 'package:elm_task/core/secure_local_data_source.dart';
import 'package:elm_task/core/network/network.dart';
import 'package:elm_task/export.dart';
import 'package:elm_task/features/auth/data/repositories/repo_imp.dart';
import 'package:elm_task/features/auth/domain/repositories/auth_repo.dart';
import 'package:elm_task/features/auth/domain/usecases/login_usecase.dart';
import 'package:elm_task/features/auth/domain/usecases/verify_usecase.dart';
import 'package:elm_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:requests_inspector/requests_inspector.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // Bloc
  sl.registerFactory(
    () => AuthBloc(loginUseCase: sl(), verifyUseCase: sl()),
  );
  // Usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => VerifyUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(remoteDataSource: sl(), networkInfo: sl()));

  // Datasources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(network: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<NetworkInterface>(
      () => Network(dio: sl(), box: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton(() => SecureLocalDataSourceImpl(box: sl()));
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(box: sl()));

  //! External
  sl.registerLazySingleton(() => GetStorage());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 1000),
        receiveTimeout: const Duration(seconds: 1000),
        // By default, Dio treats any HTTP status code from 200 to 299 as a successful response. If you need a different range or specific conditions, you can override it using validateStatus.
        validateStatus: (status) {
          // Treat status codes less than 399 as successful
          return status != null && status < 399;
        },
      )));
  sl<Dio>().interceptors.addAll(
    [
      RequestsInspectorInterceptor(),
    ],
  );
}
