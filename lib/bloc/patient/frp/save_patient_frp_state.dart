import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_patient_frp_response.dart';

@immutable
abstract class SavePatientFRPState {}

class SavePatientFRPInitial extends SavePatientFRPState {}

class SavePatientFRPSuccess extends SavePatientFRPState {
  final GetPatientFRPResponse savePatientFRPResponse;
  SavePatientFRPSuccess(this.savePatientFRPResponse);
}

class SavePatientFRPLoading extends SavePatientFRPState {}

class SavePatientFRPError extends SavePatientFRPState {
  final String message;
  SavePatientFRPError(this.message);
}
