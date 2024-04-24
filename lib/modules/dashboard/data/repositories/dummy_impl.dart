import 'dart:convert';

import 'package:dms/error/failure.dart';
import 'package:dms/modules/dashboard/domain/repositories/dummy_repository.dart';
import 'package:http/http.dart' as http;
import 'package:either_dart/either.dart';

class DummyRepositoryImpl implements DummyRespository {
  // final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> fetchData() async {
    dynamic response;

    try {
      response =
          await http.get(Uri.parse("https://api.restful-api.dev/objects"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Right(data);
      } else {
        return Left(ServerFailure(message: 'Failed to fetch data'));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
