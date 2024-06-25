import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_dental_history_response.dart';
import 'package:ortho_pms_patient/responses/get_dental_hygiens_response.dart';


@immutable
abstract class GetDentalHistoryState {}

class GetDentalHistoryInitial extends GetDentalHistoryState {}

class GetDentalHistorySuccess extends GetDentalHistoryState {
  final GetDentalHistoryResponse getDentalHistoryResponse;
  GetDentalHistorySuccess(this.getDentalHistoryResponse);
}

class GetDentalHistoryLoading extends GetDentalHistoryState {}

class GetDentalHistoryError extends GetDentalHistoryState {
  final String message;
  GetDentalHistoryError(this.message);
}
