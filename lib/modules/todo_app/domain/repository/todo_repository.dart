import 'package:dms/modules/todo_app/data/model/todo_request_model.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class ToDoRepo {
  Future<Either<Failure, dynamic>> getToDoData();
}

abstract class ToDoAddRepo {
  Future<Either<Failure, dynamic>> postToDoData(ItemRequestModel body);
}
