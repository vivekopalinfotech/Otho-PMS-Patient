import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_state.dart';
import 'package:ortho_pms_patient/responses/patient_response.dart';

class PatientCubit extends Cubit<PatientState> {
  final Repository _repository;
  PatientCubit(this._repository) : super(PatientInitial());

  Future<void> getPatient(String email) async {
    try {
      emit(PatientLoading());

      PatientResponse patientResponse = await _repository.getPatientImageBySeriesId(email);

      emit(PatientSuccess(patientResponse));
    } catch (e) {
      emit(PatientError(e.toString()));
    }
  }
}
