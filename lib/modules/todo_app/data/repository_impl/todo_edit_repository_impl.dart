import 'package:dms/modules/todo_app/data/model/todo_request_model.dart';
import 'package:dms/modules/todo_app/domain/repository/todo_repository.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/network/api_provider.dart';
import 'package:either_dart/either.dart';

class ToDOEditRepoImpl implements ToDoEditRepo {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> editToDoData(
      ItemRequestModel body, String uid) async {
    dynamic response;

    try {
      response = await _apiProvider.putData(
          baseUrl: "https://api.nstack.in/v1",
          subUrl: "/todos/$uid",
          body: body.toJson());
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
