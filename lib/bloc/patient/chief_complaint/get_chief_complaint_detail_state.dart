import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_patient_chief_complaint_detail.dart';


@immutable
abstract class GetChiefCompliantDetailState {}

class GetChiefCompliantDetailInitial extends GetChiefCompliantDetailState {}

class GetChiefCompliantDetailSuccess extends GetChiefCompliantDetailState {
  final ChiefComplaintDetailResponse chiefCompliantDetailResponse;
  GetChiefCompliantDetailSuccess(this.chiefCompliantDetailResponse);
}

class GetChiefCompliantDetailLoading extends GetChiefCompliantDetailState {}

class GetChiefCompliantDetailError extends GetChiefCompliantDetailState {
  final String message;
  GetChiefCompliantDetailError(this.message);
}
