import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/get_habits_response.dart';


@immutable
abstract class GetHabitsState {}

class GetHabitsInitial extends GetHabitsState {}

class GetHabitsSuccess extends GetHabitsState {
  final GetHabitsResponse getHabitsResponse;
  GetHabitsSuccess(this.getHabitsResponse);
}

class GetHabitsLoading extends GetHabitsState {}

class GetHabitsError extends GetHabitsState {
  final String message;
  GetHabitsError(this.message);
}
