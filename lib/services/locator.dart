import 'package:dms/modules/dashboard/data/repository_impl/get_details_repository_impl.dart';
import 'package:dms/modules/dashboard/domain/repository/get_details_repository.dart';
import 'package:dms/modules/dashboard/domain/usecase/get_details_usecase.dart';
import 'package:dms/modules/todo_app/data/repository_impl/todo_repository_impl.dart';
import 'package:dms/modules/todo_app/domain/repository/todo_repository.dart';
import 'package:dms/modules/todo_app/domain/usecase/todo_usecase.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initializeDependencies() async {
  // **************************** Get Details ****************************
  serviceLocator.registerSingleton<GetDetailsRepo>(GertDetailsRepoImpl());
  serviceLocator
      .registerLazySingleton<GetDetailsUsacase>(() => GetDetailsUsacase());
  serviceLocator.registerSingleton<ToDoRepo>(ToDORepoImpl());
  serviceLocator.registerLazySingleton<ToDOUsecase>(() => ToDOUsecase());
}
