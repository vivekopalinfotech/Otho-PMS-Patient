import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_patient_medical_history.dart';


@immutable
abstract class SaveMedicalHistoryState {}

class SaveMedicalHistoryInitial extends SaveMedicalHistoryState {}

class SaveMedicalHistorySuccess extends SaveMedicalHistoryState {
  final GetMedicalHistoryResponse saveMedicalHistoryResponse;
  SaveMedicalHistorySuccess(this.saveMedicalHistoryResponse);
}

class SaveMedicalHistoryLoading extends SaveMedicalHistoryState {}

class SaveMedicalHistoryError extends SaveMedicalHistoryState {
  final String message;
  SaveMedicalHistoryError(this.message);
}
