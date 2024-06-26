import 'package:flutter/material.dart';


@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String msg;
  ForgotPasswordSuccess(this.msg);
}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordError extends ForgotPasswordState {
  final String message;
  ForgotPasswordError(this.message);
}
