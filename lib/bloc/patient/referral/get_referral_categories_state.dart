import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_referral_categories_Response.dart';

@immutable
abstract class GetReferralCategoryState {}

class GetReferralCategoryInitial extends GetReferralCategoryState {}

class GetReferralCategorySuccess extends GetReferralCategoryState {
  final GetReferralCategoryResponse getReferralCategoryResponse;
  GetReferralCategorySuccess(this.getReferralCategoryResponse);
}

class GetReferralCategoryLoading extends GetReferralCategoryState {}

class GetReferralCategoryError extends GetReferralCategoryState {
  final String message;
  GetReferralCategoryError(this.message);
}
