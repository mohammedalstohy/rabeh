import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/responses/get_category_details_response.dart';
import '../repositories/home_repo.dart';

class GetCategoryDetailsUseCase
    extends UseCase<GetCategoryDetailsResponse, GetCategoryDetailsParams> {
  final HomeRepo repository;
  GetCategoryDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, GetCategoryDetailsResponse>> call(
      GetCategoryDetailsParams params) async {
    return await repository.getCategoryDetails(params: params);
  }
}

class GetCategoryDetailsParams {
  final int categoryID;

  GetCategoryDetailsParams({
    required this.categoryID,
  });
}