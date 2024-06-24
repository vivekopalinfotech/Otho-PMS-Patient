import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_patient_medical_history.dart';

import 'get_medical_history_state.dart';


class MedicalHistoryCubit extends Cubit<MedicalHistoryState> {
  final ApiProvider _apiProvider;
  MedicalHistoryCubit(this._apiProvider) : super(MedicalHistoryInitial());

  Future<void> getMedicalHistory() async {
    try {
      emit(MedicalHistoryLoading());

      GetMedicalHistoryResponse medicalHistoryResponse = await _apiProvider.getPatientMedicalHistory();

      emit(MedicalHistorySuccess(medicalHistoryResponse));
    } catch (e) {
      emit(MedicalHistoryError(e.toString()));
    }
  }
}
