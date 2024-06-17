
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/patient_contact_response.dart';
import 'save_patient_contact_state.dart';

class SavePatientContactCubit extends Cubit<SavePatientContactState> {
  final ApiProvider _apiProvider;
  SavePatientContactCubit(this._apiProvider) : super(SavePatientContactInitial());

  Future<void> savePatientContact(isActive,isPrimary,isSameAsPatientInfo,dob,firstName,patientContactId,middleName,lastName,patientContactPreferredName,patientContactPrimaryPhoneExt,prefix,email,phone,primaryType,relation,suffix) async {
    try {
      emit(SavePatientContactLoading());

      SavePrimaryContactResponse savePrimaryContactResponse = await _apiProvider.savePatientContact(isActive,isPrimary,isSameAsPatientInfo,dob,firstName,patientContactId,middleName,lastName,patientContactPreferredName,patientContactPrimaryPhoneExt,prefix,email,phone,primaryType,relation,suffix);

      emit(SavePatientContactSuccess(savePrimaryContactResponse));
    } catch (e) {
      emit(SavePatientContactError(e.toString()));
    }
  }
}
