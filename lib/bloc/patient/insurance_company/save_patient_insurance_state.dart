import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/save_patient_insurance_response.dart';



@immutable
abstract class SavePatientInsuranceState {}

class SavePatientInsuranceInitial extends SavePatientInsuranceState {}

class SavePatientInsuranceSuccess extends SavePatientInsuranceState {
  final SavePatientInsuranceResponse savePatientInsuranceResponse;
  SavePatientInsuranceSuccess(this.savePatientInsuranceResponse);
}

class SavePatientInsuranceLoading extends SavePatientInsuranceState {}

class SavePatientInsuranceError extends SavePatientInsuranceState {
  final String message;
  SavePatientInsuranceError(this.message);
}
