import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_allergies.dart';

@immutable
abstract class GetAllergiesState {}

class GetAllergiesInitial extends GetAllergiesState {}

class GetAllergiesSuccess extends GetAllergiesState {
  final GetAllergyResponse allergiesResponse;
  GetAllergiesSuccess(this.allergiesResponse);
}

class GetAllergiesLoading extends GetAllergiesState {}

class GetAllergiesError extends GetAllergiesState {
  final String message;
  GetAllergiesError(this.message);
}

