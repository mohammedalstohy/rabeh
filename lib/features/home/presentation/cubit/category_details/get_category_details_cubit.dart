import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/entities/responses/get_category_details_response.dart';
import '../../../domain/usecases/get_category_details.dart';

part 'get_category_details_state.dart';

class GetCategoryDetailsCubit extends Cubit<GetCategoryDetailsState> {
  GetCategoryDetailsCubit(this.usecase) : super(GetCategoryDetailsInitial());

  final GetCategoryDetailsUseCase usecase;

  Category? _category;
  Category? get category => _category;

  Future<void> fGetCategoryDetails(
      {required GetCategoryDetailsParams params}) async {
    emit(GetCategoryDetailsLoading());
    final Either<Failure, GetCategoryDetailsResponse>
        failOrCategoryDetailsResponse = await usecase(params);
    failOrCategoryDetailsResponse.fold((Failure fail) {
      if (fail is ServerFailure) {
        emit(GetCategoryDetailsError(message: fail.message));
      }
    }, (GetCategoryDetailsResponse response) {
      log('Success');
      _category = response.categories.first;
      emit(const GetCategoryDetailsLoaded());
    });
  }
}
