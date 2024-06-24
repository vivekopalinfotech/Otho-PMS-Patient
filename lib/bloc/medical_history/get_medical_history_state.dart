import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_patient_medical_history.dart';


@immutable
abstract class MedicalHistoryState {}

class MedicalHistoryInitial extends MedicalHistoryState {}

class MedicalHistorySuccess extends MedicalHistoryState {
  final GetMedicalHistoryResponse medicalHistoryResponse;
  MedicalHistorySuccess(this.medicalHistoryResponse);
}

class MedicalHistoryLoading extends MedicalHistoryState {}

class MedicalHistoryError extends MedicalHistoryState {
  final String message;
  MedicalHistoryError(this.message);
}
