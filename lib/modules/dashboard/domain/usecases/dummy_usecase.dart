import 'package:dms/error/failure.dart';
import 'package:either_dart/either.dart'; // For Failure type

abstract class FetchDataUseCase {
  Future<Either<Failure, dynamic>> fetchData();
}
