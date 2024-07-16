import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/responses/get_category_details_response.dart';
import '../entities/responses/get_coupon_details_response.dart';
import '../entities/responses/get_store_details_response.dart';
import '../usecases/get_category_details.dart';
import '../usecases/get_coupon_details.dart';
import '../usecases/get_store_details.dart';

abstract class HomeRepo {
  Future<Either<Failure, GetCategoryDetailsResponse>> getCategoryDetails(
      {required GetCategoryDetailsParams params});
  Future<Either<Failure, GetStoresOrStoreDetailsResponse>> getStoresOrStoreDetails(
      {required GetStoresOrStoreDetailsParams params});
  Future<Either<Failure, GetCouponDetailsResponse>> getCouponDetails(
      {required GetCouponDetailsParams params});

}