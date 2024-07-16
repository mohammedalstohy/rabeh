import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/responses/get_coupon_details_response.dart';
import '../repositories/home_repo.dart';

class GetCouponDetailsUseCase
    extends UseCase<GetCouponDetailsResponse, GetCouponDetailsParams> {
  final HomeRepo repository;
  GetCouponDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, GetCouponDetailsResponse>> call(
      GetCouponDetailsParams params) async {
    return await repository.getCouponDetails(params: params);
  }
}

class GetCouponDetailsParams {
  final int couponID;

  GetCouponDetailsParams({
    required this.couponID,
  });
}