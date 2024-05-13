import 'dart:async';
import 'dart:convert';
import 'package:dms/modules/dashboard/data/model/get_details_hive_model.dart';
import 'package:dms/modules/dashboard/data/model/get_details_response_model.dart';
import 'package:dms/modules/dashboard/domain/entity/get_details_attribute_model.dart';
import 'package:dms/modules/dashboard/domain/usecase/get_details_usecase.dart';
import 'package:dms/modules/dashboard/presentation/bloc/form_event.dart';
import 'package:dms/modules/dashboard/presentation/bloc/form_state.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  GetDetailsAttributeModel? getDetailsAttributeModel;

  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardInitEvent>(dashboardInitEvent);
    on<DashBoardBackEvent>(dashBoardBackEvent);
    on<DashBoardHiveEvent>(dashBoardHiveEvent);
  }

  FutureOr<void> dashboardInitEvent(
      DashboardInitEvent event, Emitter<DashboardState> emit) async {
    final repository = serviceLocator<GetDetailsUsacase>();
    final response = await repository.invoke();
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (response.isLeft) {
      emit(GetDataFailState());
    } else {
      List<GetDetailsResponseModel> listOfModel =
          getDetailsResponseModelFromJson(jsonEncode(response.right));
      final dataBox = await Hive.openBox<GetDetailsModel>('datas');
      // dataBox.add(dataMode);
      // mapping data for local db
      List<GetDetailsResponseModel> res = dataBox.values.map((e) {
        return GetDetailsResponseModel(
            name: e.name,
            id: e.id,
            data: Data(
                dataColor: e.data.dataColor,
                dataCapacity: e.data.dataCapacity,
                capacityGb: e.data.capacityGb,
                dataPrice: e.data.dataPrice,
                dataGeneration: e.data.dataGeneration,
                year: e.data.year,
                cpuModel: e.data.cpuModel,
                hardDiskSize: e.data.hardDiskSize,
                strapColour: e.data.strapColour,
                caseSize: e.data.caseSize,
                color: e.data.color,
                description: e.data.description,
                capacity: e.data.capacity,
                screenSize: e.data.screenSize,
                generation: e.data.generation,
                price: e.data.price));
      }).toList();
      for (var element in res) {
        print("response data ${element.data?.toJson().toString()}");
      }
      // for passing to ui
      List<GetDetailsAttributeModel> uiData = listOfModel.map((e) {
        return GetDetailsAttributeModel(
          name: e.name,
          id: e.id,
          data: DataAttribute(
              dataColor: e.data?.dataColor ?? "",
              dataCapacity: e.data?.dataCapacity ?? "",
              capacityGb: e.data?.capacityGb ?? 0,
              dataPrice: e.data?.dataPrice ?? 0,
              dataGeneration: e.data?.dataGeneration ?? "",
              year: e.data?.year ?? 0,
              cpuModel: e.data?.cpuModel ?? "",
              hardDiskSize: e.data?.hardDiskSize ?? "",
              strapColour: e.data?.strapColour ?? "",
              caseSize: e.data?.caseSize ?? "",
              color: e.data?.color ?? "",
              description: e.data?.description ?? "",
              capacity: e.data?.capacity ?? "",
              screenSize: e.data?.screenSize ?? 0,
              generation: e.data?.generation ?? "",
              price: e.data?.price ?? ""),
        );
      }).toList();

      for (var element in uiData) {
        var dataModel = GetDetailsModel(
            element.id ?? "",
            element.name ?? "",
            DataHive(
                element.data?.dataColor ?? "",
                element.data?.dataCapacity ?? "",
                element.data?.capacityGb ?? 0,
                element.data?.dataPrice ?? 0,
                element.data?.dataGeneration ?? "",
                element.data?.year ?? 0,
                element.data?.cpuModel ?? "",
                element.data?.hardDiskSize ?? "",
                element.data?.strapColour ?? "",
                element.data?.caseSize ?? "",
                element.data?.color ?? "",
                element.data?.description ?? "",
                element.data?.capacity ?? "",
                element.data?.screenSize ?? 0,
                element.data?.generation ?? "",
                element.data?.price ?? ""));
        dataBox.add(dataModel);
      }

      // if (connectivityResult.contains(ConnectivityResult.none)) {
      //   print("off net");
      //   List<GetDetailsAttributeModel> reponse = dataBox.values.map((e) {
      //     return GetDetailsAttributeModel(
      //         name: e.name,
      //         id: e.id,
      //         data: DataAttribute(
      //             dataColor: e.data.dataColor,
      //             dataCapacity: e.data.dataCapacity,
      //             capacityGb: e.data.capacityGb,
      //             dataPrice: e.data.dataPrice,
      //             dataGeneration: e.data.dataGeneration,
      //             year: e.data.year,
      //             cpuModel: e.data.cpuModel,
      //             hardDiskSize: e.data.hardDiskSize,
      //             strapColour: e.data.strapColour,
      //             caseSize: e.data.caseSize,
      //             color: e.data.color,
      //             description: e.data.description,
      //             capacity: e.data.capacity,
      //             screenSize: e.data.screenSize,
      //             generation: e.data.generation,
      //             price: e.data.price));
      //   }).toList();
      //   print(reponse);
      //   emit(GetDataSuccessState(reponse));
      // } else {
      //   print("net on");
      //   emit(GetDataSuccessState(uiData));
      // }
      emit(GetDataSuccessState(uiData));
    }
  }

  FutureOr<void> dashBoardBackEvent(
      DashBoardBackEvent event, Emitter<DashboardState> emit) {
    emit(DashBoardBackstate());
  }

  FutureOr<void> dashBoardHiveEvent(
      DashBoardHiveEvent event, Emitter<DashboardState> emit) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      final dataBox = await Hive.openBox<GetDetailsModel>('datas');

      List<GetDetailsAttributeModel> reponse = dataBox.values.map((e) {
        return GetDetailsAttributeModel(
            name: e.name,
            id: e.id,
            data: DataAttribute(
                dataColor: e.data.dataColor,
                dataCapacity: e.data.dataCapacity,
                capacityGb: e.data.capacityGb,
                dataPrice: e.data.dataPrice,
                dataGeneration: e.data.dataGeneration,
                year: e.data.year,
                cpuModel: e.data.cpuModel,
                hardDiskSize: e.data.hardDiskSize,
                strapColour: e.data.strapColour,
                caseSize: e.data.caseSize,
                color: e.data.color,
                description: e.data.description,
                capacity: e.data.capacity,
                screenSize: e.data.screenSize,
                generation: e.data.generation,
                price: e.data.price));
      }).toList();

      emit(GetDataSuccessState(reponse));
    } else {
      // Handle network connectivity is available scenario
    }
  }
}
