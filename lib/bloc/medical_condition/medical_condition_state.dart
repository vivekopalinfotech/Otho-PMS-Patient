import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/medical_condition_response.dart';

@immutable
abstract class MedicalConditionState {}

class MedicalConditionInitial extends MedicalConditionState {}

class MedicalConditionSuccess extends MedicalConditionState {
  final MedicalConditionResponse medicalConditionResponse;
  MedicalConditionSuccess(this.medicalConditionResponse);
}

class MedicalConditionLoading extends MedicalConditionState {}

class MedicalConditionError extends MedicalConditionState {
  final String message;
  MedicalConditionError(this.message);
}
