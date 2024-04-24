import 'dart:async';
import 'dart:convert';
import 'package:dms/dashboard/data/model/get_details_hive_model.dart';
import 'package:dms/dashboard/data/model/get_details_response_model.dart';
import 'package:dms/dashboard/domain/entity/get_details_attribute_model.dart';
import 'package:dms/dashboard/domain/usecase/get_details_usecase.dart';
import 'package:dms/dashboard/presentation/bloc/form_event.dart';
import 'package:dms/dashboard/presentation/bloc/form_state.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  GetDetailsAttributeModel? getDetailsAttributeModel;

  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardInitialEvent>(dashboardInitialEvent);
    on<DashboardInitEvent>(dashboardInitEvent);
  }

  FutureOr<void> dashboardInitialEvent(
      DashboardInitialEvent event, Emitter<DashboardState> emit) async {
    // Box<GetDetailsModel> dataBox = Hive.box<GetDetailsModel>('cats');
    var dataModel = GetDetailsModel(
        'foo',
        'hello',
        DataHive(
            "dataColor",
            "dataCapacity",
            15,
            15,
            "dataGeneration",
            15,
            "cpuModel",
            "hardDiskSize",
            "strapColour",
            "caseSize",
            "ddd",
            "description",
            "capacity",
            2,
            "generation",
            "price"));

    var dataModel2 = GetDetailsModel(
        'foo',
        'hello',
        DataHive(
            "dataColor",
            "dataCapacity",
            15,
            15,
            "dataGeneration",
            15,
            "cpuModel",
            "hardDiskSize",
            "strapColour",
            "caseSize",
            "ddd",
            "description",
            "capacity",
            2,
            "generation",
            "price"));
    // datas.put();
    // await dataBox.put(dataModel.name, dataModel);
    // print(dataBox.values.toList());

    final dataBox = await Hive.openBox<GetDetailsModel>('datas');
    dataBox.add(dataModel);
    dataBox.add(dataModel2);
    List<GetDetailsResponseModel> res = dataBox.values.map((e) {
      return GetDetailsResponseModel(
        name: e.name,
        id: e.id,
      );
    }).toList();

    // for (var element in res) {
    //   print("response data ${element.toJson().toString()}");
    // }
    emit(Datagotstate(getDetailsModel: dataBox));
  }

  FutureOr<void> dashboardInitEvent(
      DashboardInitEvent event, Emitter<DashboardState> emit) async {
    final repository = serviceLocator<GetDetailsUsacase>();
    final response = await repository.invoke();

    if (response.isLeft) {
      emit(GetDataFailState());
    } else {
      List<GetDetailsResponseModel> listOfModel =
          getDetailsResponseModelFromJson(jsonEncode(response.right));
      // final responseModel = GetDetailsResponseModel.fromJson(response.right);
      // for hive local db
      print("object");

      // var dataMode = GetDetailsModel(
      //     responseModel.id ?? "",
      //     responseModel.name ?? "",
      //     DataHive(
      //         responseModel.data?.dataColor ?? "",
      //         responseModel.data?.dataCapacity ?? "",
      //         responseModel.data?.capacityGb ?? 0,
      //         responseModel.data?.dataPrice ?? 0,
      //         responseModel.data?.dataGeneration ?? "",
      //         responseModel.data?.year ?? 0,
      //         responseModel.data?.cpuModel ?? "",
      //         responseModel.data?.hardDiskSize ?? "",
      //         responseModel.data?.strapColour ?? "",
      //         responseModel.data?.caseSize ?? "",
      //         responseModel.data?.color ?? "",
      //         responseModel.data?.description ?? "",
      //         responseModel.data?.capacity ?? "",
      //         responseModel.data?.screenSize ?? 0,
      //         responseModel.data?.generation ?? "",
      //         responseModel.data?.price ?? ""));
      print("object");
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
      print("ui dtata ${uiData.toString()}");
      // getDetailsAttributeModel = GetDetailsAttributeModel(
      //     id: responseModel.id ?? "",
      //     name: responseModel.name ?? "",
      //     data: DataAttribute(
      //         dataColor: responseModel.data?.dataColor ?? "",
      //         dataCapacity: responseModel.data?.dataCapacity ?? "",
      //         capacityGb: responseModel.data?.capacityGb ?? 0,
      //         dataPrice: responseModel.data?.dataPrice ?? 0,
      //         dataGeneration: responseModel.data?.dataGeneration ?? "",
      //         year: responseModel.data?.year ?? 0,
      //         cpuModel: responseModel.data?.cpuModel ?? "",
      //         hardDiskSize: responseModel.data?.hardDiskSize ?? "",
      //         strapColour: responseModel.data?.strapColour ?? "",
      //         caseSize: responseModel.data?.caseSize ?? "",
      //         color: responseModel.data?.color ?? "",
      //         description: responseModel.data?.description ?? "",
      //         capacity: responseModel.data?.capacity ?? "",
      //         screenSize: responseModel.data?.screenSize ?? 0,
      //         generation: responseModel.data?.generation ?? "",
      //         price: responseModel.data?.price ?? ""));

      emit(GetDataSuccessState(uiData));
    }
  }
}
