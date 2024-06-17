import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/patient_exam_history_response.dart';


@immutable
abstract class GetPatientExamHistoryState {}

class GetPatientExamHistoryInitial extends GetPatientExamHistoryState {}

class GetPatientExamHistorySuccess extends GetPatientExamHistoryState {
  final PatientExamHistoryResponse patientExamResponse;
  GetPatientExamHistorySuccess(this.patientExamResponse);
}

class GetPatientExamHistoryLoading extends GetPatientExamHistoryState {}

class GetPatientExamHistoryError extends GetPatientExamHistoryState {
  final String message;
  GetPatientExamHistoryError(this.message);
}
