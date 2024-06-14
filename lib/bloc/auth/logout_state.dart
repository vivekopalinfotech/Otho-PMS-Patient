import 'package:flutter/material.dart';


@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final String logoutResponse;
  LogoutSuccess(this.logoutResponse);
}

class LogoutLoading extends LogoutState {}

class LogoutError extends LogoutState {
  final String message;
  LogoutError(this.message);
}
