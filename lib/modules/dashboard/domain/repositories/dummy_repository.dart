import 'package:dms/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class DummyRespository {
  Future<Either<Failure, dynamic>> fetchData();
}
