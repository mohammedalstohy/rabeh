part of 'get_store_details_cubit.dart';

sealed class GetStoresOrStoreDetailsState extends Equatable {
  const GetStoresOrStoreDetailsState();

  @override
  List<Object> get props => <Object>[];
}

final class GetStoresOrStoreDetailsInitial extends GetStoresOrStoreDetailsState {}

class GetStoresOrStoreDetailsLoading extends GetStoresOrStoreDetailsState {}

class GetStoresOrStoreDetailsError extends GetStoresOrStoreDetailsState {
  final String message;
  const GetStoresOrStoreDetailsError({required this.message});
}

class GetStoresOrStoreDetailsLoaded extends GetStoresOrStoreDetailsState {
  const GetStoresOrStoreDetailsLoaded();
}