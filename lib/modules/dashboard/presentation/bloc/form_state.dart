import 'package:dms/modules/dashboard/data/model/get_details_hive_model.dart';
import 'package:dms/modules/dashboard/data/model/get_details_response_model.dart';
import 'package:dms/modules/dashboard/domain/entity/get_details_attribute_model.dart';
import 'package:hive/hive.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashBoardBackstate extends DashboardState {}

class GetDataFailState extends DashboardState {}

class GetDataSuccessState extends DashboardState {
  List<GetDetailsAttributeModel> uiData;
  GetDataSuccessState(this.uiData);
}

class GetDataNoNetState extends DashboardState {
  List<GetDetailsResponseModel> uiData;
  GetDataNoNetState(this.uiData);
}

class Datagotstate extends DashboardState {
  final Box<GetDetailsModel> getDetailsModel;

  Datagotstate({required this.getDetailsModel});
}
