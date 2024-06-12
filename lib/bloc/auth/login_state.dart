import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/login_response.dart';

@immutable
abstract class LogInState {}

class LogInInitial extends LogInState {}

class LogInSuccess extends LogInState {
  final LogInResponse logInResponse;
  LogInSuccess(this.logInResponse);
}

class LogInLoading extends LogInState {}

class LogInError extends LogInState {
  final String message;
  LogInError(this.message);
}
