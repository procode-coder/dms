import 'package:dms/modules/todo_app/data/model/todo_request_model.dart';
import 'package:dms/modules/todo_app/domain/repository/todo_repository.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/network/api_provider.dart';
import 'package:either_dart/either.dart';

class ToDODeleteRepoImpl implements ToDoDeleteRepo {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> deleteToDoData(String uid) async {
    dynamic response;

    try {
      response = await _apiProvider.deleteData(
          baseUrl: "https://api.nstack.in/v1", subUrl: "/todos/$uid"
          // body: {"id": uid}
          );
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
