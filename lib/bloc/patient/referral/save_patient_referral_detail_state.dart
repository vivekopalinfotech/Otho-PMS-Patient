import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/save_patient_referral_detail_response.dart';


@immutable
abstract class SavePatientReferralDetailState {}

class SavePatientReferralDetailInitial extends SavePatientReferralDetailState {}

class SavePatientReferralDetailSuccess extends SavePatientReferralDetailState {
  final SavePatientReferralDetailResponse patientReferralDetailResponse;
  SavePatientReferralDetailSuccess(this.patientReferralDetailResponse);
}

class SavePatientReferralDetailLoading extends SavePatientReferralDetailState {}

class SavePatientReferralDetailError extends SavePatientReferralDetailState {
  final String message;
  SavePatientReferralDetailError(this.message);
}
