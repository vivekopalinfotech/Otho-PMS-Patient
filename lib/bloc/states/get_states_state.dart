import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/states_response.dart';

@immutable
abstract class GetStatesState {}

class GetStatesInitial extends GetStatesState {}

class GetStatesSuccess extends GetStatesState {
  final StatesResponse statesResponse;
  GetStatesSuccess(this.statesResponse);
}

class GetStatesLoading extends GetStatesState {}

class GetStatesError extends GetStatesState {
  final String message;
  GetStatesError(this.message);
}
