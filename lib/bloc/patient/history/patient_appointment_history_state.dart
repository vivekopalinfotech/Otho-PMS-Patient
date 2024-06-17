import 'package:flutter/material.dart';
import 'package:ortho_pms_patient/responses/patient_appointment_history_response.dart';
import 'package:ortho_pms_patient/responses/patient_exam_by_patient_id.dart';


@immutable
abstract class GetPatientAppointmentHistoryState {}

class GetPatientAppointmentHistoryInitial extends GetPatientAppointmentHistoryState {}

class GetPatientAppointmentHistorySuccess extends GetPatientAppointmentHistoryState {
  final PatientAppointmentResponse patientAppointmentResponse;
  GetPatientAppointmentHistorySuccess(this.patientAppointmentResponse);
}

class GetPatientAppointmentHistoryLoading extends GetPatientAppointmentHistoryState {}

class GetPatientAppointmentHistoryError extends GetPatientAppointmentHistoryState {
  final String message;
  GetPatientAppointmentHistoryError(this.message);
}
