import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_dental_hygiens_response.dart';


@immutable
abstract class GetDentalHygienesState {}

class GetDentalHygienesInitial extends GetDentalHygienesState {}

class GetDentalHygienesSuccess extends GetDentalHygienesState {
  final GetDentalHygieneResponse getDentalHygieneResponse;
  GetDentalHygienesSuccess(this.getDentalHygieneResponse);
}

class GetDentalHygienesLoading extends GetDentalHygienesState {}

class GetDentalHygienesError extends GetDentalHygienesState {
  final String message;
  GetDentalHygienesError(this.message);
}
