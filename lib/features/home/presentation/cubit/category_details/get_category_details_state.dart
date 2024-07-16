part of 'get_category_details_cubit.dart';

sealed class GetCategoryDetailsState extends Equatable {
  const GetCategoryDetailsState();

  @override
  List<Object> get props => <Object>[];
}

final class GetCategoryDetailsInitial extends GetCategoryDetailsState {}

class GetCategoryDetailsLoading extends GetCategoryDetailsState {}

class GetCategoryDetailsError extends GetCategoryDetailsState {
  final String message;
  const GetCategoryDetailsError({required this.message});
}

class GetCategoryDetailsLoaded extends GetCategoryDetailsState {
  const GetCategoryDetailsLoaded();
}