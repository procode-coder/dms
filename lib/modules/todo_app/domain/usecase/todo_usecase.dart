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

class ToDOAddUsecase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(body) async {
    return await serviceLocator.get<ToDoAddRepo>().postToDoData(body);
  }
}

class ToDODeleteUsecase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(uid) async {
    return await serviceLocator.get<ToDoDeleteRepo>().deleteToDoData(uid);
  }
}

class ToDOEditUsecase implements UseCaseTwoInput {
  @override
  Future<Either<Failure, dynamic>> invoke(uid, body) async {
    return await serviceLocator.get<ToDoEditRepo>().editToDoData(body, uid);
  }
}
