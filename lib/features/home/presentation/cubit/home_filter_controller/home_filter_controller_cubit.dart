import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_filter_controller_state.dart';

class HomeFilterControllerCubit extends Cubit<HomeFilterControllerState> {
  HomeFilterControllerCubit() : super(HomeFilterControllerInitial());

  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  Future<void> changeIndex(int? newIndex) async {
    
    emit(HomeFilterControllerInitial());
    _selectedIndex = newIndex;
    emit(HomeFilterControllerIndexChanged());
  }
}
