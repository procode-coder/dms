import 'package:dms/dashboard/data/model/get_details_hive_model.dart';
import 'package:dms/dashboard/domain/entity/get_details_attribute_model.dart';
import 'package:hive/hive.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class GetDataFailState extends DashboardState {}

class GetDataSuccessState extends DashboardState {
  GetDetailsAttributeModel? getDetailsAttributeModel;
  GetDataSuccessState(this.getDetailsAttributeModel);
}

class Datagotstate extends DashboardState {
  final Box<GetDetailsModel> getDetailsModel;

  Datagotstate({required this.getDetailsModel});
}
