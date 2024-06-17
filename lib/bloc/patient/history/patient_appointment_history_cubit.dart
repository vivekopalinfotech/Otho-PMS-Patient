
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/patient_appointment_history_response.dart';


import 'patient_appointment_history_state.dart';

class GetPatientAppointmentHistoryCubit extends Cubit<GetPatientAppointmentHistoryState> {
  final ApiProvider _apiProvider;
  GetPatientAppointmentHistoryCubit(this._apiProvider) : super(GetPatientAppointmentHistoryInitial());

  Future<void> getGetPatientAppointmentHistory(patientId) async {
    try {
      emit(GetPatientAppointmentHistoryLoading());

      PatientAppointmentResponse patientAppointmentResponse = await _apiProvider.getPatientAppointmentHistory(patientId);

      emit(GetPatientAppointmentHistorySuccess(patientAppointmentResponse));
    } catch (e) {
      emit(GetPatientAppointmentHistoryError(e.toString()));
    }
  }
}
