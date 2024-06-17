import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_patient_contact_response.dart';


@immutable
abstract class GetPatientContactState {}

class GetPatientContactInitial extends GetPatientContactState {}

class GetPatientContactSuccess extends GetPatientContactState {
  final GetPrimaryContactResponse getPrimaryContactResponse;
  GetPatientContactSuccess(this.getPrimaryContactResponse);
}

class GetPatientContactLoading extends GetPatientContactState {}

class GetPatientContactError extends GetPatientContactState {
  final String message;
  GetPatientContactError(this.message);
}
