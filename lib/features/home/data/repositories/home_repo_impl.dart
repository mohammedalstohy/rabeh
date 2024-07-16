import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/responses/get_category_details_response.dart';
import '../../domain/entities/responses/get_coupon_details_response.dart';
import '../../domain/entities/responses/get_store_details_response.dart';
import '../../domain/repositories/home_repo.dart';
import '../../domain/usecases/get_category_details.dart';
import '../../domain/usecases/get_coupon_details.dart';
import '../../domain/usecases/get_store_details.dart';
import '../datasources/home_datasource.dart';

class HomeRepositoryImpl implements HomeRepo {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, GetCategoryDetailsResponse>> getCategoryDetails(
      {required GetCategoryDetailsParams params}) async {
  
      try {
        final GetCategoryDetailsResponse response =
            await remote.getCategoryDetails(params: params);
        return right(response);
      } on CacheException {
        return left(CacheFailure());
      } on ServerException catch (e) {
        return left(ServerFailure(message: e.message));
      }
  }

  @override
  Future<Either<Failure, GetStoresOrStoreDetailsResponse>> getStoresOrStoreDetails(
      {required GetStoresOrStoreDetailsParams params}) async {
  
      try {
        final GetStoresOrStoreDetailsResponse response =
            await remote.getStoresOrStoreDetails(params: params);
        return right(response);
      } on CacheException {
        return left(CacheFailure());
      } on ServerException catch (e) {
        return left(ServerFailure(message: e.message));
      }
  }

  @override
  Future<Either<Failure, GetCouponDetailsResponse>> getCouponDetails(
      {required GetCouponDetailsParams params}) async {
  
      try {
        final GetCouponDetailsResponse response =
            await remote.getCouponDetails(params: params);
        return right(response);
      } on CacheException {
        return left(CacheFailure());
      } on ServerException catch (e) {
        return left(ServerFailure(message: e.message));
      }
  }
}