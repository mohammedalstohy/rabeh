import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/responses/get_coupon_details_response.dart';
import '../../../domain/usecases/get_coupon_details.dart';

part 'get_coupon_details_state.dart';

class GetCouponDetailsCubit extends Cubit<GetCouponDetailsState> {
  GetCouponDetailsCubit(this.usecase) : super(GetCouponDetailsInitial());

  final GetCouponDetailsUseCase usecase;

  GetCouponDetailsResponse? _coupon;
  GetCouponDetailsResponse? get coupon => _coupon;

  Future<void> fGetCouponDetails(
      {required GetCouponDetailsParams params}) async {
    emit(GetCouponDetailsLoading());
    final Either<Failure, GetCouponDetailsResponse>
        failOrCouponDetailsResponse = await usecase(params);
    failOrCouponDetailsResponse.fold((Failure fail) {
      if (fail is ServerFailure) {
        emit(GetCouponDetailsError(message: fail.message));
      }
    }, (GetCouponDetailsResponse response) {
      log('Success');
      _coupon = response;
      emit(const GetCouponDetailsLoaded());
    });
  }
}
