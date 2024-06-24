import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/medical_condition/medical_condition_state.dart';
import 'package:ortho_pms_patient/responses/medical_condition_response.dart';

class MedicalConditionCubit extends Cubit<MedicalConditionState> {
  final ApiProvider _apiProvider;
  MedicalConditionCubit(this._apiProvider) : super(MedicalConditionInitial());

  Future<void> getMedicalConditions() async {
    try {
      emit(MedicalConditionLoading());

      MedicalConditionResponse medicalConditionResponse = await _apiProvider.getMedicalConditions();

      emit(MedicalConditionSuccess(medicalConditionResponse));
    } catch (e) {
      emit(MedicalConditionError(e.toString()));
    }
  }
}
