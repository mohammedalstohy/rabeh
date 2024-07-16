part of 'get_coupon_details_cubit.dart';

sealed class GetCouponDetailsState extends Equatable {
  const GetCouponDetailsState();

  @override
  List<Object> get props => <Object>[];
}

final class GetCouponDetailsInitial extends GetCouponDetailsState {}

class GetCouponDetailsLoading extends GetCouponDetailsState {}

class GetCouponDetailsError extends GetCouponDetailsState {
  final String message;
  const GetCouponDetailsError({required this.message});
}

class GetCouponDetailsLoaded extends GetCouponDetailsState {
  const GetCouponDetailsLoaded();
}