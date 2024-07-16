import 'package:get_it/get_it.dart';

import 'data/datasources/home_datasource.dart';
import 'data/repositories/home_repo_impl.dart';
import 'domain/repositories/home_repo.dart';
import 'domain/usecases/get_category_details.dart';
import 'domain/usecases/get_coupon_details.dart';
import 'domain/usecases/get_store_details.dart';

Future<void> initHomeInjection(GetIt sl) async {
  //* UseCases
  sl.registerLazySingleton(() => GetCategoryDetailsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetStoresOrStoreDetailsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCouponDetailsUseCase(repository: sl()));

  //* Repository
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepositoryImpl(
      remote: sl(),
    ),
  );

  //* Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      helper: sl(),
    ),
  );
}