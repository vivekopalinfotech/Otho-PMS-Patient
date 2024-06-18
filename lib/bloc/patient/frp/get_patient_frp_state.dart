import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_patient_frp_response.dart';


@immutable
abstract class GetPatientFRPState {}

class GetPatientFRPInitial extends GetPatientFRPState {}

class GetPatientFRPSuccess extends GetPatientFRPState {
  final GetPatientFRPResponse getPatientFRPResponse;
  GetPatientFRPSuccess(this.getPatientFRPResponse);
}

class GetPatientFRPLoading extends GetPatientFRPState {}

class GetPatientFRPError extends GetPatientFRPState {
  final String message;
  GetPatientFRPError(this.message);
}
