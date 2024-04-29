import 'package:dms/utils/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class ToDoRepo {
  Future<Either<Failure, dynamic>> getToDoData();
}
