import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_dental_history_response.dart';



@immutable
abstract class SaveDentalHistoryState {}

class SaveDentalHistoryInitial extends SaveDentalHistoryState {}

class SaveDentalHistorySuccess extends SaveDentalHistoryState {
  final GetDentalHistoryResponse saveDentalHistoryResponse;
  SaveDentalHistorySuccess(this.saveDentalHistoryResponse);
}

class SaveDentalHistoryLoading extends SaveDentalHistoryState {}

class SaveDentalHistoryError extends SaveDentalHistoryState {
  final String message;
  SaveDentalHistoryError(this.message);
}
