import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/responses/dentist_profile_response.dart';

import 'dentist_profile_state.dart';



class DentistProfileCubit extends Cubit<DentistProfileState> {
  final ApiProvider _apiProvider;
  DentistProfileCubit(this._apiProvider) : super(DentistProfileInitial());

  Future<void> dentistProfile(dentistId) async {
    try {
      emit(DentistProfileLoading());

      DentistProfileResponse dentistProfileResponse = await _apiProvider.getDentistById(dentistId);

      emit(DentistProfileSuccess(dentistProfileResponse));
    } catch (e) {
      emit(DentistProfileError(e.toString()));
    }
  }
}
