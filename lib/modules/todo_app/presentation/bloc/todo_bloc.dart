import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dms/modules/todo_app/data/model/todo_model.dart';
import 'package:dms/modules/todo_app/domain/entity/todo_entity_model.dart';
import 'package:dms/modules/todo_app/domain/usecase/todo_usecase.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_event.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_state.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoAttributeModel? getDetailsAttributeModel;

  ToDoBloc() : super(TODoInitial()) {
    on<ToDoEvent>((event, emit) {});
    on<ToDoInitialEvent>(todoInitialEvent);
  }

  FutureOr<void> todoInitialEvent(
      ToDoInitialEvent event, Emitter<ToDoState> emit) async {
    final repository = serviceLocator<ToDOUsecase>();
    final response = await repository.invoke();
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (response.isLeft) {
      emit(TODOFailState());
    } else {
      try {
        final toDoModel = toDoModelFromJson(jsonEncode(response.right));
        print(toDoModel);

        emit(ToDoSuccessState(toDoModel));
      } catch (e) {
        emit(TODOFailState());
      }
    }
  }
}
