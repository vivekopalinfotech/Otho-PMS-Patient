
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ortho_pms_patient/api/api_provider.dart';
import 'package:ortho_pms_patient/bloc/patient/frp/get_patient_frp_state.dart';
import 'package:ortho_pms_patient/responses/get_patient_frp_response.dart';



class GetPatientFRPCubit extends Cubit<GetPatientFRPState> {
  final ApiProvider _apiProvider;
  GetPatientFRPCubit(this._apiProvider) : super(GetPatientFRPInitial());

  Future<void> GetPatientFRP() async {
    try {
      emit(GetPatientFRPLoading());

      GetPatientFRPResponse getPatientFRPResponse = await _apiProvider.getPatientFinancialResponsiblePersons();

      emit(GetPatientFRPSuccess(getPatientFRPResponse));
    } catch (e) {
      emit(GetPatientFRPError(e.toString()));
    }
  }

}
