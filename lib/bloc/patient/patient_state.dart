import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/patient_response.dart';

@immutable
abstract class PatientState {}

class PatientInitial extends PatientState {}

class PatientSuccess extends PatientState {
  final PatientResponse patientResponse;
  PatientSuccess(this.patientResponse);
}

class PatientLoading extends PatientState {}

class PatientError extends PatientState {
  final String message;
  PatientError(this.message);
}
