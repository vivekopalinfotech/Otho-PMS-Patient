import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_patient_referral_detail_response.dart';


@immutable
abstract class GetPatientReferralDetailState {}

class GetPatientReferralDetailInitial extends GetPatientReferralDetailState {}

class GetPatientReferralDetailSuccess extends GetPatientReferralDetailState {
  final PatientReferralDetailResponse patientReferralDetailResponse;
  GetPatientReferralDetailSuccess(this.patientReferralDetailResponse);
}

class GetPatientReferralDetailLoading extends GetPatientReferralDetailState {}

class GetPatientReferralDetailError extends GetPatientReferralDetailState {
  final String message;
  GetPatientReferralDetailError(this.message);
}
