import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dms/modules/todo_app/data/model/todo_hive_model.dart';
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
  final TextEditingController searchTextController = TextEditingController();
  List<TodoAttributeItems> searchedTaskSlots = [];
  String message = "";
  late ToDoAttributeModel toDoAttributeModel;

  ToDoBloc() : super(TODoInitial()) {
    on<ToDoEvent>((event, emit) {});
    on<ToDoInitialEvent>(todoInitialEvent);
    on<ToDoPostInitialEvent>(todoPostInitialEvent);
    on<ToDoDeleteInitialEvent>(todoDeleteInitialEvent);
    on<ToDoEditInitialEvent>(toDoEditInitialEvent);
    on<SearchTasksEvent>(
      (event, emit) {
        if (searchTextController.text.isEmpty) {
          searchedTaskSlots = [];

          add(ToDoInitialEvent());
        } else {
          searchedTaskSlots = [];
          bool isMatchFound = false;

          toDoAttributeModel.items?.forEach((e) {
            if (e.title.toLowerCase().contains(
                      searchTextController.text.toLowerCase(),
                    ) ==
                true) {
              searchedTaskSlots.add(e);

              isMatchFound = true;

              emit(ToDoSuccessState(toDoAttributeModel));
            }
          });

          if (!isMatchFound) {
            message = "No data found";
            emit(TODoEmptystate());
          }
        }
      },
    );

    // on<ToDOHiveInitialEvent>(toDoHiveEvent);
  }

  FutureOr<void> todoInitialEvent(
      ToDoInitialEvent event, Emitter<ToDoState> emit) async {
    final repository = serviceLocator<ToDOUsecase>();
    final response = await repository.invoke();
    // emit(TODOLoadState());

    // final List<ConnectivityResult> connectivityResult =
    //     await (Connectivity().checkConnectivity());
    // final dataBox = await Hive.openBox<ToDoHiveModel>('values');
    // ToDoModel res = ToDoModel(
    //     code: dataBox.values.first.code ?? 0,
    //     success: dataBox.values.first.success ?? false,
    //     timestamp: dataBox.values.first.timestamp ?? 0,
    //     message: dataBox.values.first.message ?? "",
    //     items: dataBox.values.first.items
    //         ?.map((e) => Item(
    //               createdAt: e.createdAt ?? DateTime.now(),
    //               description: e.description ?? "",
    //               id: e.id ?? "",
    //               isCompleted: e.isCompleted ?? false,
    //               title: e.title ?? "",
    //               updatedAt: e.updatedAt ?? DateTime.now(),
    //             ))
    //         .toList(),
    //     meta: Meta(
    //         currentPage: dataBox.values.first.meta?.currentPage ?? 0,
    //         hasMorePage: dataBox.values.first.meta?.hasMorePage ?? false,
    //         pageSize: dataBox.values.first.meta?.pageSize ?? 0,
    //         perPageItem: dataBox.values.first.meta?.perPageItem ?? 0,
    //         totalItems: dataBox.values.first.meta?.totalItems ?? 0,
    //         totalPages: dataBox.values.first.meta?.totalPages ?? 0));

    // print(res);
    if (response.isLeft) {
      emit(TODOFailState());
    } else {
      try {
        final toDoModel = toDoModelFromJson(jsonEncode(response.right));
        toDoAttributeModel = ToDoAttributeModel(
            code: toDoModel.code ?? 0,
            success: toDoModel.success ?? false,
            message: toDoModel.message ?? "",
            timestamp: toDoModel.timestamp ?? 0,
            items: toDoModel.items
                ?.map((e) => TodoAttributeItems(
                    description: e.description ?? "Saurabh",
                    createdAt: e.createdAt ?? DateTime.now(),
                    id: e.id ?? "663c9c778e47deee7ac1c61d",
                    isCompleted: e.isCompleted ?? false,
                    title: e.title ?? "helloy",
                    updatedAt: e.updatedAt ?? DateTime.now()))
                .toList(),
            meta: ToDoMetaItems(
                currentPage: toDoModel.meta?.currentPage ?? 0,
                hasMorePage: toDoModel.meta?.hasMorePage ?? false,
                pageSize: toDoModel.meta?.pageSize ?? 0,
                perPageItem: toDoModel.meta?.perPageItem ?? 0,
                totalItems: toDoModel.meta?.totalItems ?? 0,
                totalPages: toDoModel.meta?.totalPages ?? 0));
        // emit(ToDoTestState());
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
        if (response.right == []) {
          emit(TODoEmptystate());
        } else {
          descriptionController.clear();
          titleController.clear();
          emit(ToDoPostSuccessState());
        }
      } catch (e) {
        emit(TODOPostFailState());
      }
    }
  }

  // FutureOr<void> toDoHiveEvent(
  //     ToDOHiveInitialEvent event, Emitter<ToDoState> emit) async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());

  //   // if (connectivityResult == ConnectivityResult.none) {
  //   final dataBox = await Hive.openBox<ToDoHiveModel>('values');
  //   ToDoAttributeModel res = ToDoAttributeModel(
  //       code: dataBox.values.first.code ?? 0,
  //       success: dataBox.values.first.success ?? false,
  //       timestamp: dataBox.values.first.timestamp ?? 0,
  //       message: dataBox.values.first.message ?? "",
  //       items: dataBox.values.first.items
  //           ?.map((e) => TodoAttributeItems(
  //                 createdAt: e.createdAt ?? DateTime.now(),
  //                 description: e.description ?? "",
  //                 id: e.id ?? "",
  //                 isCompleted: e.isCompleted ?? false,
  //                 title: e.title ?? "",
  //                 updatedAt: e.updatedAt ?? DateTime.now(),
  //               ))
  //           .toList(),
  //       meta: ToDoMetaItems(
  //           currentPage: dataBox.values.first.meta?.currentPage ?? 0,
  //           hasMorePage: dataBox.values.first.meta?.hasMorePage ?? false,
  //           pageSize: dataBox.values.first.meta?.pageSize ?? 0,
  //           perPageItem: dataBox.values.first.meta?.perPageItem ?? 0,
  //           totalItems: dataBox.values.first.meta?.totalItems ?? 0,
  //           totalPages: dataBox.values.first.meta?.totalPages ?? 0));

  //   emit(ToDoHiveSuccessState(res));
  //   // } else {
  //   //   emit(TODOHiveFailState());
  //   // }
  // }

  FutureOr<void> todoDeleteInitialEvent(
      ToDoDeleteInitialEvent event, Emitter<ToDoState> emit) async {
    emit(TODoDeleteInitial());
    final repository = serviceLocator<ToDODeleteUsecase>();
    final response = await repository.invoke(event.uid ?? "");

    if (response.isLeft) {
      emit(TODODeleteFailState());
    } else {
      try {
        if (response.right == []) {
          emit(TODoEmptystate());
        } else {
          descriptionController.clear();
          titleController.clear();
          emit(ToDoDeleteSuccessState());
        }
      } catch (e) {
        emit(TODODeleteFailState());
      }
    }
  }

  FutureOr<void> toDoEditInitialEvent(
      ToDoEditInitialEvent event, Emitter<ToDoState> emit) async {
    emit(TODoEditInitial());
    final repository = serviceLocator<ToDOEditUsecase>();
    final response = await repository.invoke(
        event.uid ?? "",
        ItemRequestModel(
          description: descriptionController.text,
          title: titleController.text,
        ));
    print(response);
    if (response.isLeft) {
      emit(TODOEditFailState());
    } else {
      try {
        if (response.right == []) {
          emit(TODoEmptystate());
        } else {
          descriptionController.clear();
          titleController.clear();
          emit(ToDoEditSuccessState());
        }
      } catch (e) {
        emit(TODOEditFailState());
      }
    }
  }
}
