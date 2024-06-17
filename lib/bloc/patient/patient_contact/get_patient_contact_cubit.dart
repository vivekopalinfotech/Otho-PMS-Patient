
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/patient_contact/get_patient_contact_state.dart';
import 'package:ortho_pms_patient/responses/get_patient_contact_response.dart';


class GetPatientContactCubit extends Cubit<GetPatientContactState> {
  final ApiProvider _apiProvider;
  GetPatientContactCubit(this._apiProvider) : super(GetPatientContactInitial());

  Future<void> GetPatientContact() async {
    try {
      emit(GetPatientContactLoading());

      GetPrimaryContactResponse getPrimaryContactResponse = await _apiProvider.getPatientContact();

      emit(GetPatientContactSuccess(getPrimaryContactResponse));
    } catch (e) {
      emit(GetPatientContactError(e.toString()));
    }
  }

}
