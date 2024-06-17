
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/patient_exam_history_response.dart';
import 'patient_exam_history_state.dart';

class GetPatientExamHistoryCubit extends Cubit<GetPatientExamHistoryState> {
  final ApiProvider _apiProvider;
  GetPatientExamHistoryCubit(this._apiProvider) : super(GetPatientExamHistoryInitial());

  Future<void> getGetPatientExamHistory(patientId) async {
    try {
      emit(GetPatientExamHistoryLoading());

      PatientExamHistoryResponse patientExamResponse = await _apiProvider.getPatientExamHistory(patientId);

      emit(GetPatientExamHistorySuccess(patientExamResponse));
    } catch (e) {
      emit(GetPatientExamHistoryError(e.toString()));
    }
  }
}
