import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/dentist_profile_response.dart';

@immutable
abstract class DentistProfileState {}

class DentistProfileInitial extends DentistProfileState {}

class DentistProfileSuccess extends DentistProfileState {
  final DentistProfileResponse dentistProfileResponse;
  DentistProfileSuccess(this.dentistProfileResponse);
}

class DentistProfileLoading extends DentistProfileState {}

class DentistProfileError extends DentistProfileState {
  final String message;
  DentistProfileError(this.message);
}
