
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/get_patient_exam_by_patient_id_state.dart';
import 'package:ortho_pms_patient/responses/patient_exam_by_patient_id.dart';

class GetPatientExamByPatientIdCubit extends Cubit<GetPatientExamByPatientIdState> {
  final ApiProvider _apiProvider;
  GetPatientExamByPatientIdCubit(this._apiProvider) : super(GetPatientExamByPatientIdInitial());

  Future<void> getGetPatientExamByPatientId(patientId) async {
    try {
      emit(GetPatientExamByPatientIdLoading());

      PatientExamByPatientIdResponse patientExamByPatientIdResponse = await _apiProvider.getPatientExamByPatientId(patientId);

      emit(GetPatientExamByPatientIdSuccess(patientExamByPatientIdResponse));
    } catch (e) {
      emit(GetPatientExamByPatientIdError(e.toString()));
    }
  }
}
