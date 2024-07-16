import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/responses/get_store_details_response.dart';
import '../repositories/home_repo.dart';

class GetStoresOrStoreDetailsUseCase
    extends UseCase<GetStoresOrStoreDetailsResponse, GetStoresOrStoreDetailsParams> {
  final HomeRepo repository;
  GetStoresOrStoreDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, GetStoresOrStoreDetailsResponse>> call(
      GetStoresOrStoreDetailsParams params) async {
    return await repository.getStoresOrStoreDetails(params: params);
  }
}

class GetStoresOrStoreDetailsParams {
  final int? storeID;

  GetStoresOrStoreDetailsParams({
    required this.storeID,
  });
}