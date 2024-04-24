import 'package:dms/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class UseCaseNoInput<Output> {
  Future<Either<Failure, Output>> invoke();
}
