import 'package:dms/modules/dashboard/domain/repository/get_details_repository.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/network/api_provider.dart';
import 'package:either_dart/either.dart';

class GertDetailsRepoImpl implements GetDetailsRepo {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> getdetails() async {
    dynamic response;

    try {
      response = await _apiProvider.getData(
          baseUrl: "https://api.restful-api.dev", subUrl: "/objects", body: {});
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }

    if (response == null) {
      return Left(ServerFailure(message: "No Response"));
    } else {
      return Right(response);
    }
  }
}
