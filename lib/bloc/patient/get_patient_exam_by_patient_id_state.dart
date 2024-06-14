import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/patient_by_id_response.dart';
import 'package:ortho_pms_patient/responses/patient_exam_by_patient_id.dart';


@immutable
abstract class GetPatientExamByPatientIdState {}

class GetPatientExamByPatientIdInitial extends GetPatientExamByPatientIdState {}

class GetPatientExamByPatientIdSuccess extends GetPatientExamByPatientIdState {
  final PatientExamByPatientIdResponse patientExamByPatientIdResponse;
  GetPatientExamByPatientIdSuccess(this.patientExamByPatientIdResponse);
}

class GetPatientExamByPatientIdLoading extends GetPatientExamByPatientIdState {}

class GetPatientExamByPatientIdError extends GetPatientExamByPatientIdState {
  final String message;
  GetPatientExamByPatientIdError(this.message);
}
