
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/referral/save_patient_referral_detail_state.dart';
import 'package:ortho_pms_patient/responses/save_patient_referral_detail_response.dart';





class SavePatientReferralDetailCubit extends Cubit<SavePatientReferralDetailState> {
  final ApiProvider _apiProvider;
  SavePatientReferralDetailCubit(this._apiProvider) : super(SavePatientReferralDetailInitial());

  Future<void> savePatientReferralDetails(patientReferralId,referralCategoryId,referralNotes,referralSubCategoryId,referredDentistId) async {
    try {
      emit(SavePatientReferralDetailLoading());

      SavePatientReferralDetailResponse patientReferralDetailResponse = await _apiProvider.savePatientReferralDetails(patientReferralId,referralCategoryId,referralNotes,referralSubCategoryId,referredDentistId);

      emit(SavePatientReferralDetailSuccess(patientReferralDetailResponse));
    } catch (e) {
      emit(SavePatientReferralDetailError(e.toString()));
    }
  }

}
