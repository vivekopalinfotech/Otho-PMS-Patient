import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/change_password_response.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final ChangePasswordResponse changePasswordResponse;
  ChangePasswordSuccess(this.changePasswordResponse);
}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordError extends ChangePasswordState {
  final String message;
  ChangePasswordError(this.message);
}
