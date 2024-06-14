import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_state.dart';
import 'package:ortho_pms_patient/responses/patient_response.dart';

class PatientCubit extends Cubit<PatientState> {
  final ApiProvider _apiProvider;
  PatientCubit(this._apiProvider) : super(PatientInitial());

  Future<void> getPatientByEmail(String email) async {
    try {
      emit(PatientLoading());

      PatientResponse patientResponse = await _apiProvider.getPatientByEmail(email);

      emit(PatientSuccess(patientResponse));
    } catch (e) {
      emit(PatientError(e.toString()));
    }
  }
}
