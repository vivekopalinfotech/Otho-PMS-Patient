import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/policy_response.dart';

@immutable
abstract class GetPolicyState {}

class GetPolicyInitial extends GetPolicyState {}

class GetPolicySuccess extends GetPolicyState {
  final PolicyResponse policyResponse;
  GetPolicySuccess(this.policyResponse);
}

class GetPolicyLoading extends GetPolicyState {}

class GetPolicyError extends GetPolicyState {
  final String message;
  GetPolicyError(this.message);
}
