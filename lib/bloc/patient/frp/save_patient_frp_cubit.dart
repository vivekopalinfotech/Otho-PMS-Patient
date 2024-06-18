
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_patient_frp_response.dart';
import 'save_patient_frp_state.dart';



class SavePatientFRPCubit extends Cubit<SavePatientFRPState> {
  final ApiProvider _apiProvider;
  SavePatientFRPCubit(this._apiProvider) : super(SavePatientFRPInitial());

  Future<void> savePatientFRP(
      isPatientFrp,
      patientFinancialResponsiblePersonId,
      prefix,
      firstName,
      middleName,
      lastName,
      suffix,
      patientFRPPreferredName,
      dob,
      address1,
      address2,
      city,
      state,
      abbreviation,
      zipCode,
      primaryPhone,
      patientFRPPrimaryPhoneExt,
      primaryType,
      secondaryPhone,
      patientFRPSecondaryPhoneExt,
      secondaryType,
      relation,
      createFrpUser,
      isActive,
      isPrimary,
      isSameAsPcInfo,
      isSameAsPatientAddress,
      patientFRPIndex,
      isEmail,
      isText,
      email,
      isPatientFRP) async {
    try {
      emit(SavePatientFRPLoading());

      GetPatientFRPResponse savePatientFRPResponse = await _apiProvider.savePatientFRP(
          isPatientFrp,
          patientFinancialResponsiblePersonId,
          prefix,
          firstName,
          middleName,
          lastName,
          suffix,
          patientFRPPreferredName,
          dob,
          address1,
          address2,
          city,
          state,
          abbreviation,
          zipCode,
          primaryPhone,
          patientFRPPrimaryPhoneExt,
          primaryType,
          secondaryPhone,
          patientFRPSecondaryPhoneExt,
          secondaryType,
          relation,
          createFrpUser,
          isActive,
          isPrimary,
          isSameAsPcInfo,
          isSameAsPatientAddress,
          patientFRPIndex,
          isEmail,
          isText,
          email,
          isPatientFRP);

      emit(SavePatientFRPSuccess(savePatientFRPResponse));
    } catch (e) {
      emit(SavePatientFRPError(e.toString()));
    }
  }

}
