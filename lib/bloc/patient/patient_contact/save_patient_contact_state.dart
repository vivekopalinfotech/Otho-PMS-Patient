import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/patient_contact_response.dart';
import 'package:ortho_pms_patient/responses/patient_exam_by_patient_id.dart';


@immutable
abstract class SavePatientContactState {}

class SavePatientContactInitial extends SavePatientContactState {}

class SavePatientContactSuccess extends SavePatientContactState {
  final SavePrimaryContactResponse savePrimaryContactResponse;
  SavePatientContactSuccess(this.savePrimaryContactResponse);
}

class SavePatientContactLoading extends SavePatientContactState {}

class SavePatientContactError extends SavePatientContactState {
  final String message;
  SavePatientContactError(this.message);
}
