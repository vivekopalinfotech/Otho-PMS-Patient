import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_insurance_companies.dart';



@immutable
abstract class PracticeInsuranceCompanyState {}

class PracticeInsuranceCompanyInitial extends PracticeInsuranceCompanyState {}

class PracticeInsuranceCompanySuccess extends PracticeInsuranceCompanyState {
  final PracticeInsuranceCompanyResponse practiceInsuranceCompanyResponse;
  PracticeInsuranceCompanySuccess(this.practiceInsuranceCompanyResponse);
}

class PracticeInsuranceCompanyLoading extends PracticeInsuranceCompanyState {}

class PracticeInsuranceCompanyError extends PracticeInsuranceCompanyState {
  final String message;
  PracticeInsuranceCompanyError(this.message);
}
