
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_patient_referral_detail_response.dart';
import 'get_patient_referral_detail_state.dart';




class GetPatientReferralDetailCubit extends Cubit<GetPatientReferralDetailState> {
  final ApiProvider _apiProvider;
  GetPatientReferralDetailCubit(this._apiProvider) : super(GetPatientReferralDetailInitial());

  Future<void> GetPatientReferralDetail() async {
    try {
      emit(GetPatientReferralDetailLoading());

      PatientReferralDetailResponse patientReferralDetailResponse = await _apiProvider.getPatientReferralDetails();

      emit(GetPatientReferralDetailSuccess(patientReferralDetailResponse));
    } catch (e) {
      emit(GetPatientReferralDetailError(e.toString()));
    }
  }

}
