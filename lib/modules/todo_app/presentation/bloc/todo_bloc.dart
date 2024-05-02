import 'dart:async';
import 'dart:convert';
import 'package:dms/modules/todo_app/data/model/todo_model.dart';
import 'package:dms/modules/todo_app/data/model/todo_request_model.dart';
import 'package:dms/modules/todo_app/domain/entity/todo_entity_model.dart';
import 'package:dms/modules/todo_app/domain/usecase/todo_usecase.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_event.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_state.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  ToDoBloc() : super(TODoInitial()) {
    on<ToDoEvent>((event, emit) {});
    on<ToDoInitialEvent>(todoInitialEvent);
    on<ToDoPostInitialEvent>(todoPostInitialEvent);
  }

  FutureOr<void> todoInitialEvent(
      ToDoInitialEvent event, Emitter<ToDoState> emit) async {
    final repository = serviceLocator<ToDOUsecase>();
    final response = await repository.invoke();
    // final List<ConnectivityResult> connectivityResult =
    //     await (Connectivity().checkConnectivity());

    if (response.isLeft) {
      emit(TODOFailState());
    } else {
      try {
        final toDoModel = toDoModelFromJson(jsonEncode(response.right));
        final toDoAttributeModel = ToDoAttributeModel(
            code: toDoModel.code ?? 0,
            success: toDoModel.success ?? false,
            message: toDoModel.message ?? "",
            timestamp: toDoModel.timestamp ?? 0,
            items: toDoModel.items
                ?.map((e) => TodoAttributeItems(
                    description: e.description ?? "",
                    createdAt: e.createdAt ?? DateTime.now(),
                    id: e.id ?? "",
                    isCompleted: e.isCompleted ?? false,
                    title: e.title ?? "",
                    updatedAt: e.updatedAt ?? DateTime.now()))
                .toList(),
            meta: ToDoMetaItems(
                currentPage: toDoModel.meta?.currentPage ?? 0,
                hasMorePage: toDoModel.meta?.hasMorePage ?? false,
                pageSize: toDoModel.meta?.pageSize ?? 0,
                perPageItem: toDoModel.meta?.perPageItem ?? 0,
                totalItems: toDoModel.meta?.totalItems ?? 0,
                totalPages: toDoModel.meta?.totalPages ?? 0));

        emit(ToDoSuccessState(toDoAttributeModel));
      } catch (e) {
        emit(TODOFailState());
      }
    }
  }

  FutureOr<void> todoPostInitialEvent(
      ToDoPostInitialEvent event, Emitter<ToDoState> emit) async {
    emit(TODoPostInitial());
    final repository = serviceLocator<ToDOAddUsecase>();
    final response = await repository.invoke(ItemRequestModel(
      description: descriptionController.text,
      title: titleController.text,
    ));

    if (response.isLeft) {
      emit(TODOPostFailState());
    } else {
      try {
        print(response);
        emit(ToDoPostSuccessState());
        descriptionController.clear();
        titleController.clear();
      } catch (e) {
        emit(TODOPostFailState());
      }
    }
  }
}
