import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/chief_complaint/save_chief_complaint_detail_state.dart';
import 'package:ortho_pms_patient/responses/get_patient_chief_complaint_detail.dart';


class SaveChiefCompliantDetailCubit extends Cubit<SaveChiefCompliantDetailState> {
  final ApiProvider _apiProvider;
  SaveChiefCompliantDetailCubit(this._apiProvider) : super(SaveChiefCompliantDetailInitial());

  Future<void> savePatientChiefComplaintDetails (chiefComplaintTypeId,patientChiefComplaintId,patientChiefComplaintNotes) async {
    try {
      emit(SaveChiefCompliantDetailLoading());

      ChiefComplaintDetailResponse saveChiefCompliantDetailResponse = await _apiProvider.savePatientChiefComplaintDetails (chiefComplaintTypeId,patientChiefComplaintId,patientChiefComplaintNotes);

      emit(SaveChiefCompliantDetailSuccess(saveChiefCompliantDetailResponse));
    } catch (e) {
      emit(SaveChiefCompliantDetailError(e.toString()));
    }
  }
}
