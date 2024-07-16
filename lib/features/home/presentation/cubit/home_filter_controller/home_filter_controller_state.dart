part of 'home_filter_controller_cubit.dart';

sealed class HomeFilterControllerState extends Equatable {
  const HomeFilterControllerState();

  @override
  List<Object> get props => <Object>[];
}

class HomeFilterControllerInitial extends HomeFilterControllerState {}

class HomeFilterControllerIndexChanged extends HomeFilterControllerState {}
