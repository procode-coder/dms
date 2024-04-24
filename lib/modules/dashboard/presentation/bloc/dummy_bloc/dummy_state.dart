import 'package:dms/modules/dashboard/domain/entities/dummy_entities.dart';

abstract class DummyState {}

class InitialState extends DummyState {}

class LoadingState extends DummyState {}

class DataLoadedState extends DummyState {
  final DummyAttributesItems data;

  DataLoadedState(this.data);
}

class ErrorState extends DummyState {
  final String message;

  ErrorState(this.message);
}
