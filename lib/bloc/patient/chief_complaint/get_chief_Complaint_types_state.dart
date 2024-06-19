import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_chief_complaint_types.dart';

@immutable
abstract class GetChiefCompliantTypesState {}

class GetChiefCompliantTypesInitial extends GetChiefCompliantTypesState {}

class GetChiefCompliantTypesSuccess extends GetChiefCompliantTypesState {
  final GetChiefCompliantTypesResponse getChiefCompliantTypesResponse;
  GetChiefCompliantTypesSuccess(this.getChiefCompliantTypesResponse);
}

class GetChiefCompliantTypesLoading extends GetChiefCompliantTypesState {}

class GetChiefCompliantTypesError extends GetChiefCompliantTypesState {
  final String message;
  GetChiefCompliantTypesError(this.message);
}
