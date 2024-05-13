import 'package:dms/modules/dashboard/domain/repository/get_details_repository.dart';
import 'package:dms/services/locator.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/usecase/use_case.dart';
import 'package:either_dart/either.dart';

class GetDetailsUsacase implements UseCaseNoInput {
  @override
  Future<Either<Failure, dynamic>> invoke() async {
    return await serviceLocator.get<GetDetailsRepo>().getdetails();
  }
}
