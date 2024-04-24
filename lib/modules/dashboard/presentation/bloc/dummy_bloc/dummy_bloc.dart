import 'dart:async';
import 'package:dms/modules/dashboard/data/models/dummy.dart';

import 'package:dms/modules/dashboard/domain/entities/dummy_entities.dart';

import 'package:dms/modules/dashboard/domain/usecases/dummy_usecase.dart';
import 'package:dms/modules/dashboard/presentation/bloc/dummy_bloc/dummy_event.dart';
import 'package:dms/modules/dashboard/presentation/bloc/dummy_bloc/dummy_state.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define BLoC
class DummyBloc extends Bloc<DummyEvent, DummyState> {
  DummyBloc() : super(InitialState()) {
    on<DummyEvent>((event, emit) {});

    on<FetchDataEvent>(
      fetchDataEvent,
    );
  }

  DummyAttributesItems? dummyAttributesItems;

  FutureOr<void> fetchDataEvent(
      FetchDataEvent event, Emitter<DummyState> emit) async {
    emit(LoadingState());
    final repository = await DummyUseCase();
    final response = await repository.invoke();

    if (response.isLeft) {
      emit(ErrorState(""));
    } else {
      if (response.right == [] || response.right.length == 0) {
        emit(LoadingState());
      } else {
        DummyModel dummyModel;
        dummyModel = DummyModel.fromJson(response.right[0]);
        print(response.right);
        dummyAttributesItems = DummyAttributesItems(
          id: dummyModel.id ?? "",
          name: dummyModel.id ?? "",
          data: DataAttributeModel(
            capacity: dummyModel.data?.capacity ?? "",
            capacityGb: dummyModel.data?.capacityGb ?? 0,
            caseSize: dummyModel.data?.caseSize ?? "",
            color: dummyModel.data?.color ?? "",
            dataColor: dummyModel.data?.dataColor ?? "",
            cpuModel: dummyModel.data?.cpuModel ?? "",
          ),
        );
        emit(DataLoadedState(const DummyAttributesItems()));
      }
    }
  }
}
