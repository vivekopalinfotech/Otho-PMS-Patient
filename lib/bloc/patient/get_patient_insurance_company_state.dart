import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/insurance_response.dart';


@immutable
abstract class GetPatientInsuranceCompanyState {}

class GetPatientInsuranceCompanyInitial extends GetPatientInsuranceCompanyState {}

class GetPatientInsuranceCompanySuccess extends GetPatientInsuranceCompanyState {
  final InsuranceResponse insuranceResponse;
  GetPatientInsuranceCompanySuccess(this.insuranceResponse);
}

class GetPatientInsuranceCompanyLoading extends GetPatientInsuranceCompanyState {}

class GetPatientInsuranceCompanyError extends GetPatientInsuranceCompanyState {
  final String message;
  GetPatientInsuranceCompanyError(this.message);
}
