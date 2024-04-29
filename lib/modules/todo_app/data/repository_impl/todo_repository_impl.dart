import 'package:dms/modules/todo_app/domain/repository/todo_repository.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/network/api_provider.dart';
import 'package:either_dart/either.dart';

class ToDORepoImpl implements ToDoRepo {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> getToDoData() async {
    dynamic response;

    try {
      response = await _apiProvider.getData(
          baseUrl: "https://dummyjson.com", subUrl: "/todos", body: {});
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
