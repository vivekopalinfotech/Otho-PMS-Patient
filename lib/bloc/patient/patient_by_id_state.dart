import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/patient_by_id_response.dart';


@immutable
abstract class PatientByIdState {}

class PatientByIdInitial extends PatientByIdState {}

class PatientByIdSuccess extends PatientByIdState {
  final PatientByIdResponse patientByIdResponse;
  PatientByIdSuccess(this.patientByIdResponse);
}

class PatientByIdLoading extends PatientByIdState {}

class PatientByIdError extends PatientByIdState {
  final String message;
  PatientByIdError(this.message);
}
