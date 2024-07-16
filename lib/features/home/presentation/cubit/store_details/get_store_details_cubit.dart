import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/responses/get_store_details_response.dart';
import '../../../domain/entities/store.dart';
import '../../../domain/usecases/get_store_details.dart';

part 'get_store_details_state.dart';

class GetStoresOrStoreDetailsCubit extends Cubit<GetStoresOrStoreDetailsState> {
  GetStoresOrStoreDetailsCubit(this.usecase)
      : super(GetStoresOrStoreDetailsInitial());

  final GetStoresOrStoreDetailsUseCase usecase;

  Store? _storeDetails;
  Store? get storeDetails => _storeDetails;

  List<Store>? _storesList = [];
  List<Store>? get storesList => _storesList;

  Future<void> fGetStoreDetails(
      {required GetStoresOrStoreDetailsParams params}) async {
    emit(GetStoresOrStoreDetailsLoading());
    final Either<Failure, GetStoresOrStoreDetailsResponse>
        failOrStoreDetailsResponse = await usecase(params);
    failOrStoreDetailsResponse.fold((Failure fail) {
      if (fail is ServerFailure) {
        emit(GetStoresOrStoreDetailsError(message: fail.message));
      }
    }, (GetStoresOrStoreDetailsResponse response) {
      log('Success');
      _storeDetails = response.store!.first;
      emit(const GetStoresOrStoreDetailsLoaded());
    });
  }

  Future<void> fGetHomeStores() async {
    emit(GetStoresOrStoreDetailsLoading());
    final Either<Failure, GetStoresOrStoreDetailsResponse>
        failOrStoreDetailsResponse = await usecase(
      GetStoresOrStoreDetailsParams(storeID: null),
    );
    failOrStoreDetailsResponse.fold((Failure fail) {
      if (fail is ServerFailure) {
        emit(GetStoresOrStoreDetailsError(message: fail.message));
      }
    }, (GetStoresOrStoreDetailsResponse response) {
      log('Success');
      _storesList = response.store;
      emit(const GetStoresOrStoreDetailsLoaded());
    });
  }
}
