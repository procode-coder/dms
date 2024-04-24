import 'package:dms/utils/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class GetDetailsRepo {
  Future<Either<Failure, dynamic>> getdetails();
}
