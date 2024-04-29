import 'package:dms/modules/todo_app/domain/repository/todo_repository.dart';
import 'package:dms/services/locator.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/usecase/use_case.dart';
import 'package:either_dart/either.dart';

class ToDOUsecase implements UseCaseNoInput {
  @override
  Future<Either<Failure, dynamic>> invoke() async {
    return await serviceLocator.get<ToDoRepo>().getToDoData();
  }
}
