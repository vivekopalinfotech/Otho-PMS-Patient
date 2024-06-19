
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/get_patient_chief_complaint_detail.dart';

import 'get_chief_complaint_detail_state.dart';




class GetChiefCompliantDetailCubit extends Cubit<GetChiefCompliantDetailState> {
  final ApiProvider _apiProvider;
  GetChiefCompliantDetailCubit(this._apiProvider) : super(GetChiefCompliantDetailInitial());

  Future<void> GetChiefCompliantDetail() async {
    try {
      emit(GetChiefCompliantDetailLoading());

      ChiefComplaintDetailResponse getChiefCompliantDetailResponse = await _apiProvider.getPatientChiefComplaintDetails();

      emit(GetChiefCompliantDetailSuccess(getChiefCompliantDetailResponse));
    } catch (e) {
      emit(GetChiefCompliantDetailError(e.toString()));
    }
  }

}
