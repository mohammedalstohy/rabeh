import 'dart:developer';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/api_basehelper.dart';
import '../../domain/entities/responses/get_category_details_response.dart';
import '../../domain/entities/responses/get_coupon_details_response.dart';
import '../../domain/entities/responses/get_store_details_response.dart';
import '../../domain/usecases/get_category_details.dart';
import '../../domain/usecases/get_coupon_details.dart';
import '../../domain/usecases/get_store_details.dart';

const String getCategoryDetailsApi = '/api/category/get/';
const String getStoreDetailsApi = '/api/store/';
const String getCouponDetailsApi = '/api/coupon/';

abstract class HomeRemoteDataSource {
  Future<GetCategoryDetailsResponse> getCategoryDetails(
      {required GetCategoryDetailsParams params});
  Future<GetStoresOrStoreDetailsResponse> getStoresOrStoreDetails(
      {required GetStoresOrStoreDetailsParams params});
  Future<GetCouponDetailsResponse> getCouponDetails(
      {required GetCouponDetailsParams params});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiBaseHelper helper;

  HomeRemoteDataSourceImpl({required this.helper});

  @override
  Future<GetCategoryDetailsResponse> getCategoryDetails(
      {required GetCategoryDetailsParams params}) async {
    try {
      late final dynamic response;
      response = await helper.get(
          url: '$getCategoryDetailsApi?category_id=${params.categoryID}');

      final GetCategoryDetailsResponse data =
          GetCategoryDetailsResponse.fromJson(response);
      log(data.categories.length.toString());
      return data;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<GetStoresOrStoreDetailsResponse> getStoresOrStoreDetails(
      {required GetStoresOrStoreDetailsParams params}) async {
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final String _url = params.storeID != null
          ? '$getStoreDetailsApi?store_id=${params.storeID}'
          : getStoreDetailsApi;
      late final dynamic response;
      response = await helper.get(url: _url);

      final GetStoresOrStoreDetailsResponse data =
          GetStoresOrStoreDetailsResponse.fromJson(response);
      log(data.store!.length.toString());
      return data;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<GetCouponDetailsResponse> getCouponDetails(
      {required GetCouponDetailsParams params}) async {
    try {
      late final dynamic response;
      response =
          await helper.get(url: '$getCouponDetailsApi?id=${params.couponID}');

      final GetCouponDetailsResponse data =
          GetCouponDetailsResponse.fromJson(response);
      log(data.coupon!.store!.id.toString());
      return data;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
