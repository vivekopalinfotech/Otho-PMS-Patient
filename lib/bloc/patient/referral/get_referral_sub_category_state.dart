import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_referral_sub_categories_response.dart';


@immutable
abstract class GetReferralSubCategoryState {}

class GetReferralSubCategoryInitial extends GetReferralSubCategoryState {}

class GetReferralSubCategorySuccess extends GetReferralSubCategoryState {
  final GetReferralSubCategoryResponse getReferralSubCategoryResponse;
  GetReferralSubCategorySuccess(this.getReferralSubCategoryResponse);
}

class GetReferralSubCategoryLoading extends GetReferralSubCategoryState {}

class GetReferralSubCategoryError extends GetReferralSubCategoryState {
  final String message;
  GetReferralSubCategoryError(this.message);
}
