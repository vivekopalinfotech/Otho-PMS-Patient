import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/save_patient_emergency_contact_detail_response.dart';

@immutable
abstract class SavePatientEmergencyContactState {}

class SavePatientEmergencyContactInitial extends SavePatientEmergencyContactState {}

class SavePatientEmergencyContactSuccess extends SavePatientEmergencyContactState {
  final  SavePatientEmergencyContactDetailResponse savePatientEmergencyContactDetailResponse;
  SavePatientEmergencyContactSuccess(this.savePatientEmergencyContactDetailResponse);
}

class SavePatientEmergencyContactLoading extends SavePatientEmergencyContactState {}

class SavePatientEmergencyContactError extends SavePatientEmergencyContactState {
  final String message;
  SavePatientEmergencyContactError(this.message);
}
