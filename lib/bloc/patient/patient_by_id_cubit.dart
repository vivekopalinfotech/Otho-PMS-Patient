import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_by_id_state.dart';
import 'package:ortho_pms_patient/responses/patient_by_id_response.dart';

class PatientByIdCubit extends Cubit<PatientByIdState> {
  final ApiProvider _apiProvider;
  PatientByIdCubit(this._apiProvider) : super(PatientByIdInitial());

  Future<void> getPatientById(patientId) async {
    try {
      emit(PatientByIdLoading());

      PatientByIdResponse patientByIdResponse = await _apiProvider.getPatientById(patientId);

      emit(PatientByIdSuccess(patientByIdResponse));
    } catch (e) {
      emit(PatientByIdError(e.toString()));
    }
  }
}
