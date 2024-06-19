import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_patient_chief_complaint_detail.dart';

@immutable
abstract class SaveChiefCompliantDetailState {}

class SaveChiefCompliantDetailInitial extends SaveChiefCompliantDetailState {}

class SaveChiefCompliantDetailSuccess extends SaveChiefCompliantDetailState {
  final ChiefComplaintDetailResponse chiefCompliantDetailResponse;
  SaveChiefCompliantDetailSuccess(this.chiefCompliantDetailResponse);
}

class SaveChiefCompliantDetailLoading extends SaveChiefCompliantDetailState {}

class SaveChiefCompliantDetailError extends SaveChiefCompliantDetailState {
  final String message;
  SaveChiefCompliantDetailError(this.message);
}
