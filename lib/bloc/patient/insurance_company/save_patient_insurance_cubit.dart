
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/insurance_company/save_patient_insurance_state.dart';
import 'package:ortho_pms_patient/responses/save_patient_insurance_response.dart';

class SavePatientInsuranceCubit extends Cubit<SavePatientInsuranceState> {
  final ApiProvider _apiProvider;
  SavePatientInsuranceCubit(this._apiProvider) : super(SavePatientInsuranceInitial());

  Future<void> savePatientInsurance(
      patientInsuranceId,practiceInsuranceCompanyId,subscriberPrefix,subscriberFirstName,subscriberMiddleName,subscriberLastName,
      subscriberSuffix,subscriberPrimaryPhone,subscriberPrimaryPhoneExt,subscriberPrimaryPhoneType,subscriberSecondaryPhone,subscriberSecondaryPhoneExt,subscriberSecondaryPhoneType,
      subscriberDob,subscriberGender,subscriberRelationshipToPatient,subscriberSsn,subscriberAddress1,subscriberAddress2,subscriberCity,subscriberState,subscriberZip,
      subscriberGroupPlanNumber,subscriberMemberNumber,networkType,groupEmployerName,isPrimary,isActive,isPolicyHolderSameAsPatient,isPolicyHolderAddressSameAsPatient,deactivateInsuranceReason,
      practiceInsuranceCompanyName,practiceInsuranceCompanyPhone,practiceInsuranceCompanyPhoneExt,practiceInsuranceCompanyAddress1,practiceInsuranceCompanyAddress2,
      practiceInsuranceCompanyCity,practiceInsuranceCompanyState,practiceInsuranceCompanyZipcode
      ) async {
    try {
      emit(SavePatientInsuranceLoading());

      SavePatientInsuranceResponse savePatientInsuranceResponse = await _apiProvider.savePatientInsurance(
          patientInsuranceId,practiceInsuranceCompanyId,subscriberPrefix,subscriberFirstName,subscriberMiddleName,subscriberLastName,
          subscriberSuffix,subscriberPrimaryPhone,subscriberPrimaryPhoneExt,subscriberPrimaryPhoneType,subscriberSecondaryPhone,subscriberSecondaryPhoneExt,subscriberSecondaryPhoneType,
          subscriberDob,subscriberGender,subscriberRelationshipToPatient,subscriberSsn,subscriberAddress1,subscriberAddress2,subscriberCity,subscriberState,subscriberZip,
          subscriberGroupPlanNumber,subscriberMemberNumber,networkType,groupEmployerName,isPrimary,isActive,isPolicyHolderSameAsPatient,isPolicyHolderAddressSameAsPatient,deactivateInsuranceReason,
          practiceInsuranceCompanyName,practiceInsuranceCompanyPhone,practiceInsuranceCompanyPhoneExt,practiceInsuranceCompanyAddress1,practiceInsuranceCompanyAddress2,
          practiceInsuranceCompanyCity,practiceInsuranceCompanyState,practiceInsuranceCompanyZipcode
      );

      emit(SavePatientInsuranceSuccess(savePatientInsuranceResponse));
    } catch (e) {
      emit(SavePatientInsuranceError(e.toString()));
    }
  }
}
