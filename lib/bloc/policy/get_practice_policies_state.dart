import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_practice_policies_response.dart';

@immutable
abstract class GetPracticePoliciesState {}

class GetPracticePoliciesInitial extends GetPracticePoliciesState {}

class GetPracticePoliciesSuccess extends GetPracticePoliciesState {
  final GetPracticePoliciesResponse getPracticePoliciesResponse;
  GetPracticePoliciesSuccess(this.getPracticePoliciesResponse);
}

class GetPracticePoliciesLoading extends GetPracticePoliciesState {}

class GetPracticePoliciesError extends GetPracticePoliciesState {
  final String message;
  GetPracticePoliciesError(this.message);
}
