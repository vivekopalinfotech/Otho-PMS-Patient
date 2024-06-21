import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_dentist_response.dart';

@immutable
abstract class GetDentistState {}

class GetDentistInitial extends GetDentistState {}

class GetDentistSuccess extends GetDentistState {
  final GetDentistResponse getDentistResponse;
  GetDentistSuccess(this.getDentistResponse);
}

class GetDentistLoading extends GetDentistState {}

class GetDentistError extends GetDentistState {
  final String message;
  GetDentistError(this.message);
}
