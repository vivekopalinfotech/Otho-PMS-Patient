
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/save_patient_emergency_contact_detail_state.dart';
import 'package:ortho_pms_patient/responses/save_patient_emergency_contact_detail_response.dart';

class SavePatientEmergencyContactCubit extends Cubit<SavePatientEmergencyContactState> {
  final ApiProvider _apiProvider;
  SavePatientEmergencyContactCubit(this._apiProvider) : super(SavePatientEmergencyContactInitial());

  Future<void> savePatientEmergencyContactDetails(dob, firstName, lastName,phone,phoneExt,phoneType,relationship) async {
    try {
      emit(SavePatientEmergencyContactLoading());

      SavePatientEmergencyContactDetailResponse savePatientEmergencyContactDetailResponse = await _apiProvider.savePatientEmergencyContactDetails(dob, firstName, lastName,phone,phoneExt,phoneType,relationship);

      emit(SavePatientEmergencyContactSuccess(savePatientEmergencyContactDetailResponse));
    } catch (e) {
      emit(SavePatientEmergencyContactError(e.toString()));
    }
  }
}
